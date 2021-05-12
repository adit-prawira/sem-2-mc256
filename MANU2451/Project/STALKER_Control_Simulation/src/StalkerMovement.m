classdef StalkerMovement
    %STALKERMOVEMENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        motor_speed; 
    end
    
    methods
        function obj = StalkerMovement(inputArg1,inputArg2)
            %STALKERMOVEMENT Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function ref = right()
        end
        
        function ref = left()
        end
        
        function ref = forward()
        end
        
        function ref = backward()
        end
        
        function ref = forwardRight()
        end
        
        function ref = forwardLeft()
        end
        
        function ref = backwardLeft()
        end
        
        function ref = backwardRight()
        end
        
      
        
        function outputArg = move(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
        
        
    end
end

