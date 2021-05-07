%% Lidar Sensor Example
% Copyright 2018-2019 The MathWorks, Inc.
close all

%% Create environment
load exampleMap

% Create lidar sensor
lidar = LidarSensor;
lidar.sensorOffset = [0,0];
lidar.scanAngles = linspace(-pi/2,pi/2,9);
lidar.maxRange = 5;

% Create visualizer
viz = Visualizer2D;
viz.mapName = 'map';
attachLidarSensor(viz,lidar);

%% Simulation parameters
sampleTime = 0.1;              % Sample time [s]
angle_d = 90;
angle_r = angle_d * pi/180;

x0 = 2;
y0 = 1;

initPose = [x0; y0; angle_r];        % Initial pose (x y theta)
%% INITIALIZE ANGULAR VELOCITIES FROM MOTOR
w1 = 10; % angular velocity of motor 1
w2 = 10; % angular velocity of motor 2
w3 = 10; % angular velocity of motor 3
w4 = 10; % angular velocity of motor 4
w_motor = [w1; w2; w3; w4];

robot_velocities = num2cell(forwardKinematics(robot, w_motor));

[vx, vy, w] = robot_velocities{:};
vx = round(vx,2);
vy = round(vy,2);
w = round(w,2);

% Initialize time, input, and pose arrays
tVec = 0:sampleTime:50;         % Time array
vxRef = vx*ones(size(tVec));   % Reference x speed
vyRef = vy*ones(size(tVec));

% Reference y speed
wRef = w*ones(size(tVec));       % Reference angular speed

ref = [vxRef;vyRef;wRef];
pose = zeros(3,numel(tVec));    % Pose matrix
pose(:,1) = initPose;


%% Simulation loop
r = rateControl(1/sampleTime);
for idx = 2:numel(tVec)   
    fprintf("n_iteration = %d\n", idx);
    % Convert the reference speeds to world coordinates
    vel = bodyToWorld(ref(:,idx-1),pose(:,idx-1));
    
    % Perform forward discrete integration step
    pose(:,idx) = pose(:,idx-1) + vel*sampleTime;
    
    % Update lidar and visualization
    ranges = lidar(pose(:,idx));
    cellRanges = num2cell(ranges);
    [range1, range2, range3, range4, range5, range6, range7] = cellRanges{:};
    if(range5 < 0.5)
        %% INITIALIZE ANGULAR VELOCITIES FROM MOTOR
        w1 = 10; % angular velocity of motor 1
        w2 = -10; % angular velocity of motor 2
        w3 = 10; % angular velocity of motor 3
        w4 = -10; % angular velocity of motor 4
        w_motor = [w1; w2; w3; w4];

        robot_velocities = num2cell(forwardKinematics(robot, w_motor));

        [vx, vy, w] = robot_velocities{:};
        vx = round(vx,2);
        vy = round(vy,2);
        w = round(w,2);
        fprintf("omega = %d\n", w);
        
        % Initialize time, input, and pose arrays
        vxRef = vx*ones(size(tVec));   % Reference x speed
        vyRef = vy*ones(size(tVec));

        % Reference y speed
        wRef = w*ones(size(tVec));       % Reference angular speed

        ref = [vxRef;vyRef;wRef];
    end
    
    fprintf("range1 = %f\nrange2 = %f\nrange3 = %f\nrange4 = %f\nrange5 = %f\nrange6 = %f\nrange7 = %f\n",range1, range2, range3, range4, range5, range6, range7);
    viz(pose(:,idx),ranges)
    waitfor(r);
end