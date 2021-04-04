classdef ModelPID
    properties
       Kc;
       tauI; tauD; tauF;
       Cs; Fds
       P; D; I; N;
    end
    
    methods
        function obj = ModelPID(a1, a2, b0, b1, damp_coeff, wn, lambda)
            c2 = (-2*damp_coeff*wn*a1 - lambda*a1 + a1^2 + wn^2 + 2*lambda*damp_coeff*wn - (b1*lambda*wn^2/b0))/(b0 - a1*b1);
            gamma = (lambda*wn^2)/(b0*c2);
            I0 = -c2*b1 + 2*damp_coeff*wn + lambda - a1;
            c1 = c2*(gamma + a2);
            c0 = c2*a2*gamma;
            obj.tauF = 1/I0;
            obj.tauI = (c1/c0) - obj.tauF;
            obj.Kc = obj.tauI*obj.tauF*c0;
            obj.tauD = (c2*obj.tauI*obj.tauF - obj.Kc*obj.tauI*obj.tauF)/(obj.Kc*obj.tauI);
            obj.Cs= tf([obj.Kc*obj.tauI obj.Kc], [obj.tauI 0]);
            obj.Fds= tf([obj.Kc*obj.tauD 0], [obj.tauF 1]);
            obj.P = obj.Kc;
            obj.I = obj.Kc/obj.tauI;
            obj.D = obj.Kc*obj.tauD;
            obj.N = 1/(obj.tauF);
            fprintf("gamma = %f\n", c2);
        end
    end
end

