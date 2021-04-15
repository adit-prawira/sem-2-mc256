%% Created by: Aditya Prawira
%  RMIT ID: S3859061

classdef ModelPID
    properties
       Kc;
       tauI; tauD; tauF;
       P; D; I; N;
    end
    
    methods
        function obj = ModelPID(a1, a2, b0, b1, lambda)
            c2 = (-3*a1*lambda + a1^2 + 3*lambda^2 - (b1*lambda^3/b0))/(b0 - a1*b1);
            gamma = (lambda^3)/(b0*c2);
            I0 = -c2*b1 + 3*lambda - a1;
            c1 = c2*(gamma + a2);
            c0 = c2*a2*gamma;
            obj.tauF = 1/I0;
            obj.tauI = (c1/c0) - obj.tauF;
            obj.Kc = obj.tauI*obj.tauF*c0;
            obj.tauD = (c2*obj.tauI*obj.tauF - obj.Kc*obj.tauI*obj.tauF)/(obj.Kc*obj.tauI);
            obj.P = obj.Kc;
            obj.I = obj.Kc/obj.tauI;
            obj.D = obj.Kc*obj.tauD;
            obj.N = 1/(obj.tauF);
        end
    end
end

