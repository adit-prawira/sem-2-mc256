clear
close all 
clc

viz = Visualizer2D; % Visual object
viz.showTrajectory = false;

load exampleMap
viz.mapName = 'map';

%% Paramteres to initialize position and direciton of the robot
angle_d = 90;
angle_r = angle_d * pi/180;

x0 = 2;
y0 = 1;

post = [x0; y0; angle_r]; % initialize position and direction angle
viz(post);

%% Section for setting up Lidar sensor
release(viz);
lidar = LidarSensor;
lidar.scanAngles = linspace(-pi/2, pi/2, 7);
attachLidarSensor(viz, lidar)

%% INITIALIZE ROBOT BODY
R = 0.05;
Lx = 0.35393; % Wheel base = 353.93 mm
Ly = 0.4014; % Wheel track = 401.4 mm
robot = FourWheelMecanum(R, Lx, Ly); % our robot body

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


%% Section for Animation
delta_t = 0.1;
tSim = 0: delta_t: 10;
loop_rate = rateControl(1/delta_t);
% 
% ref = [vx; vy; w];
% post = zeros(3,numel(tSim));    % Pose matrix
% post(:,1) = initPost;

ranges = lidar(post);
cellRanges = num2cell(ranges);
[range1, range2, range3, range4, range5, range6, range7] = cellRanges{:};
% 
% for i = :numel(tSim)   
%     % Convert the reference speeds to world coordinates
%     vel = bodyToWorld(ref(:,i-1),post(:,i-1));
%     
%     % Perform forward discrete integration step
%     post(:,i) = post(:,i-1) + vel*delta_t;
%     
%     % Update lidar and visualization
%     ranges = lidar(post(:,i));
%     viz(post(:,i),ranges)
%     waitfor(loop_rate);
% end


for i = 1:3
     fprintf("n_iteration = %d\n", i);
     
     if(danger_range(range1, range2, range3, range4, range5, range6, range7))
         break;
     end
     post = post + [0; 1; 0];
     ranges = lidar(post);
     cellRanges = num2cell(ranges);
     [range1, range2, range3, range4, range5, range6, range7] = cellRanges{:};
     fprintf("range1 = %f\nrange2 = %f\nrange3 = %f\nrange4 = %f\nrange5 = %f\nrange6 = %f\nrange7 = %f\n",range1, range2, range3, range4, range5, range6, range7);
     viz(post, ranges);
     waitfor(loop_rate);
 end


