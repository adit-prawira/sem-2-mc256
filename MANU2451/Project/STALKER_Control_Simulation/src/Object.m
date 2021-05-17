classdef Object
    %OBJECT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x;y;label
    end
    
    methods
        function obj = Object(x, y, label)
            obj.x = x;
            obj.y = y;
            obj.label = label;
        end
    end
end

