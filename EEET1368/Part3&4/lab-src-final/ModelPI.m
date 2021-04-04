classdef ModelPI
    %MODELPI Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Kc
        tauI
    end
    
    methods
        function obj = ModelPI(wn, zeta, a, b)
            obj.Kc = (2*zeta*wn - a)/b;
            c1 = obj.Kc;
            c0 = wn^2 / b;
            obj.tauI = c1/c0;
        end
    end
end

