classdef FirstOrderPI
    %MODELPI Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Kc; tauI;
        Cs; P; I;
    end
    
    methods
        function obj = FirstOrderPI(wn, zeta, a, b)
           c1 = (2*zeta*wn - a)/b;
           c0 = wn^2 / b;
           
           obj.Kc = c1;
           obj.tauI = c1/c0;
           obj.Cs = tf([c1 c0], [1 0]);
           obj.P = obj.Kc;
           obj.I = obj.Kc/obj.tauI;
        end
        
        
    end
end

