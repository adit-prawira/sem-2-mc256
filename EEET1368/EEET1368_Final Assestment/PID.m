classdef PID
    properties
        Kc;
        tauI; tauD; tauF;
        P; D; I; N;
        Cs;
    end
    
    methods
        function obj = PID(I0, c2, c1, c0)
            obj.tauF = 1/I0;
            obj.tauI = (c1/c0) - obj.tauF;
            obj.Kc = obj.tauI*obj.tauF*c0;
            obj.tauD = (c2*obj.tauI*obj.tauF - obj.Kc*obj.tauI*obj.tauF)...
                /(obj.Kc*obj.tauI);
            obj.P = obj.Kc;
            obj.I = obj.Kc/obj.tauI;
            obj.D = obj.Kc*obj.tauD;
            obj.N = 1/(obj.tauF);
            obj.Cs = tf([c2 c2 c0], [1 I0 0]);
        end
    end
end

