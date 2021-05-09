%% STALKER ROBOT SIMULATIONS

clear
clc
%% KEY BINDING CONSTANTS
UP = 82;
DOWN = 81; 
RIGHT = 79;
LEFT = 80;
ESC = 41;
CLOCKWISE = 7; % d key
ANTI_CLOCKWISE = 4; % a key

%% SIMULATION ENVIRONMENT SETUP INTERFACE
fprintf("\nDo you want to start the simulation?\nPress Enter to "+...
    "process or any key to cancel\n") ;

val = getkey;
start = 0;

if(val == 13)
    start = 1;
    val = 0;
    map = input("Enter a number to choose simulation's map:\n"+...
        "1 - Simple map\n2 - Complex map\n");
    if(map == 1)
        load exampleMap
    else
        load complexMap
    end
    fprintf("\nStatus: Simulation has started...\n");
else
    fprintf("\nStatus: Simulation cancelled\n");
end

%% Create lidar sensor
lidar = LidarSensor;
lidar.sensorOffset = [0,0];
lidar.scanAngles = linspace(-pi/2,pi/2,9);
lidar.maxRange = 5;

%% INITIALIZE ROBOT BODY
R = 0.05;
Lx = 0.35393; % Wheel base = 353.93 mm
Ly = 0.3354; % Wheel track = 401.4 mm
robot = FourWheelMecanum(R, Lx, Ly); % our robot body

%% Create visualizer
viz = Visualizer2D;
viz.mapName = 'map';
viz.showTrajectory = false;
attachLidarSensor(viz,lidar);
set(0,'DefaultFigureWindowStyle','docked') 
%% Simulation parameters
sampleTime = 0.1;              % Sample time [s]
angle_d = 90;
angle_r = angle_d * pi/180;
MAX_TIME = 999;
x0 = 2;
y0 = 1;
motor_speed = 18.8496;
SAFE_RANGE = 0.5;
initpost = [x0; y0; angle_r];        % Initial post (x y theta)
tVec = 0:sampleTime:double(MAX_TIME);         % Time array/vector

%% Initilize Robot's reference movement
ref = move_forward(robot, tVec, motor_speed);       
post = zeros(3,numel(tVec));    % postion matrix
post(:,1) = initpost;

%% Simulation loop
r = rateControl(1/sampleTime);
iter = 2;
i = iter;
while start
    %fprintf("n_iteration = %d\n", i);
    % Convert the reference speeds to world coordinates
    vel = bodyToWorld(ref(:,i-1),post(:,i-1));

    % Perform forward discrete integration step
    post(:,i) = post(:,i-1) + vel*sampleTime;

    % Update lidar and visualization
    ranges = lidar(post(:,i));
    viz(post(:,i),ranges)
    waitfor(r);
    
    [keyIsDown, secs, keyCode, deltaSecs] = KbCheck(-1);
    
    if(keyIsDown)
        val = find(keyCode==1);
        if(length(val) == 1)
            if(val == ESC)
                start = 0;
                fprintf("\nStatus: Simulation has ended\n");
            end

            if(val == UP)
                ref = move_forward(robot, tVec, motor_speed);
                i =danger_range(ranges, SAFE_RANGE, i, "forward");
            end
            if(val == DOWN)
                ref = move_backward(robot, tVec, motor_speed);
                i = danger_range(ranges, SAFE_RANGE, i, "backward");
            end
            if(val == RIGHT)
                ref = move_right(robot, tVec, motor_speed);
                i = danger_range(ranges, SAFE_RANGE, i, "right");
            end
            if(val == LEFT)
                ref = move_left(robot, tVec, motor_speed);
                i = danger_range(ranges, SAFE_RANGE, i, "left");
            end
            
            if(val == CLOCKWISE)
                ref = rotate_clockwise(robot, tVec, motor_speed);
                i = i + 1;
                cellRanges = num2cell(ranges);
                [range1, range2, range3, range4, range5, range6, ...
                    range7, range8, range9] = cellRanges{:};
                fprintf("range1 = %f, range2 = %f, range3 = %f, "...
                    +"range4 = %f, range5 = %f, range6 = %f, "...
                    +"range7 = %f, range8 = %f, range9 = %f\n",...
                    range1, range2, range3, range4, ...
                    range5, range6, range7, range8, range9);
            end
            if(val == ANTI_CLOCKWISE)
                ref = rotate_anticlockwise(robot, tVec, motor_speed);
                i = i + 1;
                cellRanges = num2cell(ranges);
                [range1, range2, range3, range4, range5, range6, ...
                    range7, range8, range9] = cellRanges{:};
                fprintf("range1 = %f, range2 = %f, range3 = %f, "...
                    +"range4 = %f, range5 = %f, range6 = %f, "...
                    +"range7 = %f, range8 = %f, range9 = %f\n",...
                    range1, range2, range3, range4, ...
                    range5, range6, range7, range8, range9);
            end
        end
        
    end
    
end
