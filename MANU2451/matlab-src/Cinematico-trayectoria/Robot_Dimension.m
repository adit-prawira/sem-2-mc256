function Robot_Dimension(scale)

% ROBOT_DIMENSION(scale) loads robot physical parameters.
%   scale = scale to be used to plot the robot. Default values are in
%   meters.

if nargin < 1
    scale = 1;
end    

et = 1.4;       % error factor for parameter estimates

Robot.theta = [0.26038*et 0.25095*et -0.00049969*et 0.99646*et 0.002629*et 1.0768*et];
Robot.theta_est = [0.26038 0.25095 -0.00049969 0.99646 0.002629 1.0768];
%Robot.theta_est = Robot.theta; % Exatct parameters

%%% Distance between the virtual axle and point of interessed
Robot.a = 0.0;

% Aceleration and speed limits for the Pioneer robot
Robot.up_max = 0.3; % [m/s^2]
Robot.wp_max = 1.745; % [rad/s^2]
Robot.u_max = 0.75; % [m/s]
Robot.w_max = 1.745; % [rad/s]

% Sample period of the robot servos and sensors.
Robot.Ta = 0.1;     % [s]

%%% Robot physical dimensions

            %   1       2       3       4       5       6       7
            
            
            
% Robot.Ci1 = [[-0.3   -0.28   -0.18   -0.18   -0.15   -0.135   -0.12   0.12    0.135   0.15    0.18    0.18    0.28    0.29   0.295     0.3     0.3     0.295    0.29     0.28    0.18  (21)     0.18     0.15     0.135   0.12   -0.12    -0.135  -0.15  -0.18   -0.18     -0.28   -0.3];...
%             [0.07   0.105   0.105   0.155  0.155    0.14     0.18    0.18    0.14    0.155   0.155 (11)0.105   0.105   0.007  0.0575   0.0035  -0.035  -0.0575   -0.07   -0.105   -0.105  -0.155   -0.155  -0.140   -0.18   -0.18   -0.14   -0.155   -0.155   -0.105   -0.105  -0.07];...
%             [0.020  0.020   0.020   0.020   0.020    0.020   0.020  0.020    0.020   0.020    0.020   0.020   0.020   0.020   0.020   0.020   0.020   0.020    0.020    0.020   0.020   0.020   0.020     0.020    0.020   0.020   0.020   0.020   0.020     0.020    0.020    0.020]]*scale; 
  
        
                %cara inferior
Robot.Ci1 = [[-0.3   -0.28   -0.18   -0.18   -0.28   -0.3];[0.07   0.105   0.105   -0.105  -0.105   -0.07];[0.020  0.020   0.020   0.020   0.020    0.020]]*scale; 

Robot.Ci2 = [[-0.18   -0.18   -0.15   -0.135   -0.12    0.12    0.135     0.15    0.18    0.18      0.18     0.18     0.15     0.135    0.12   -0.12    -0.135  -0.15     -0.18   -0.18 ];...
              [0.105   0.155  0.155    0.14     0.18    0.18     0.14     0.155   0.155   0.105   -0.105   -0.155   -0.155    -0.140   -0.18   -0.18   -0.14   -0.155   -0.155   -0.105 ];...
              [0.020   0.020   0.020   0.020   0.020    0.020    0.020    0.020   0.020   0.020     0.020  0.020     0.020    0.020     0.020   0.020    0.020   0.020   0.020   0.020 ]]*scale;         
       

 Robot.Ci3 = [[0.18    0.28    0.29   0.295     0.3     0.3     0.295    0.29     0.28    0.18];...
              [0.105   0.105   0.07  0.0575   0.035  -0.035  -0.0575   -0.07   -0.105   -0.105 ];...
              [0.020   0.020   0.020   0.020   0.020    0.020    0.020    0.020   0.020   0.020 ]]*scale;                  
% cara superior

Robot.Cs1 = [Robot.Ci1(1,:);Robot.Ci1(2,:);0.08*scale+Robot.Ci1(3,:)]; 
Robot.Cs2 = [Robot.Ci2(1,:);Robot.Ci2(2,:);0.08*scale+Robot.Ci2(3,:)]; 
Robot.Cs3 = [Robot.Ci3(1,:);Robot.Ci3(2,:);0.08*scale+Robot.Ci3(3,:)]; 
       


%tapas


Robot.T1 = [-0.3 -0.3  -0.3  -0.3 ; -0.07  0.07  0.07  -0.07; 0.020   0.020   0.1 0.1]*scale;
Robot.T2 = [-0.3 -0.28 -0.28 -0.3 ; 0.07  0.105  0.105  0.07; 0.020 0.020 0.1 0.1]*scale;
Robot.T3 = [-0.3 -0.28 -0.28 -0.3 ; (-1/scale)*Robot.T2(2,:); 0.020 0.020 0.1 0.1]*scale;
Robot.T4 = [-0.28 -0.18 -0.18 -0.28;0.105 0.105 0.105 0.105; 0.020 0.020 0.1 0.1]*scale;
Robot.T5 = [   Robot.T4(1,:); -1*Robot.T4(2,:); Robot.T4(3,:)];
Robot.T6 = [-1*Robot.T4(1,:);    Robot.T4(2,:); Robot.T4(3,:)];
Robot.T7 = [-1*Robot.T4(1,:); -1*Robot.T4(2,:); Robot.T4(3,:)];

Robot.T8 = [-0.18 -0.18 -0.18 -0.18;0.105 0.155 0.155 0.105; 0.020 0.020 0.1 0.1]*scale;
Robot.T9 = [   Robot.T8(1,:); -1*Robot.T8(2,:); Robot.T8(3,:)];
Robot.T10 = [-1*Robot.T8(1,:);    Robot.T8(2,:); Robot.T8(3,:)];
Robot.T11 = [-1*Robot.T8(1,:); -1*Robot.T8(2,:); Robot.T8(3,:)];

Robot.T12 = [-0.18 -0.15 -0.15 -0.18;0.155 0.155 0.155 0.155; 0.020 0.020 0.1 0.1]*scale;
Robot.T13 = [   Robot.T12(1,:); -1*Robot.T12(2,:); Robot.T12(3,:)];
Robot.T14 = [-1*Robot.T12(1,:);    Robot.T12(2,:); Robot.T12(3,:)];
Robot.T15 = [-1*Robot.T12(1,:); -1*Robot.T12(2,:); Robot.T12(3,:)];


Robot.T16 = [-0.15 -0.135 -0.135 -0.15;0.155 0.14 0.14 0.155; 0.020 0.020 0.1 0.1]*scale;
Robot.T17 = [   Robot.T16(1,:); -1*Robot.T16(2,:); Robot.T16(3,:)];
Robot.T18 = [-1*Robot.T16(1,:);    Robot.T16(2,:); Robot.T16(3,:)];
Robot.T19 = [-1*Robot.T16(1,:); -1*Robot.T16(2,:); Robot.T16(3,:)];


Robot.T20 = [-0.135 -0.12 -0.12 -0.135;0.14 0.18 0.18 0.14; 0.020 0.020 0.1 0.1]*scale;
Robot.T21 = [   Robot.T20(1,:); -1*Robot.T20(2,:); Robot.T20(3,:)];
Robot.T22 = [-1*Robot.T20(1,:);    Robot.T20(2,:); Robot.T20(3,:)];
Robot.T23 = [-1*Robot.T20(1,:); -1*Robot.T20(2,:); Robot.T20(3,:)];

Robot.T24 = [-0.12 0.12 0.12 -0.12;0.18 0.18 0.18 0.18; 0.020 0.020 0.1 0.1]*scale;
Robot.T25 = [   Robot.T24(1,:); -1*Robot.T24(2,:); Robot.T24(3,:)];

Robot.T26 = [0.28 0.29 0.29 0.28;0.105 0.07 0.07 0.105; 0.020 0.020 0.1 0.1]*scale;
Robot.T27 = [   Robot.T26(1,:); -1*Robot.T26(2,:); Robot.T26(3,:)];

Robot.T28 = [0.29 0.295 0.295 0.29;0.07 0.0575 0.0575 0.07; 0.020 0.020 0.1 0.1]*scale;
Robot.T29 = [   Robot.T28(1,:); -1*Robot.T28(2,:); Robot.T28(3,:)];

Robot.T30 = [0.295 0.3 0.3 0.295 ;0.0575  0.035 0.035 0.0575; 0.020 0.020 0.1 0.1]*scale;
Robot.T31 = [   Robot.T30(1,:); -1*Robot.T30(2,:); Robot.T30(3,:)];

Robot.T32 = [0.3 0.3 0.3 0.3;0.035 -0.035 -0.035 0.035; 0.020 0.020 0.1 0.1]*scale;
% 
%LLANTAS

Robot.La = [[-0.01624  -0.01148    0     0.01148  0.01624  0.01148       0      -0.01148];...
            [  0        0           0      0        0        0          0         0];...
            [   0       0.01148   0.01624  0.01148   0      -0.01148  -0.01624  -0.01148]];

Robot.Lb = [[-0.0433 -0.03061      0     0.0306  0.0433  0.03061      0      -0.03061];...
            [  0        0          0      0        0        0        0        0      ];...
            [ 0       0.03061   0.0433   0.03061    0    -0.03061  -0.0433   -0.03061]];


        
%%%%%%%%%--------------------------------------------

Robot.L1 = [0.23+Robot.La(1,:);0.110+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L2 = [0.23+Robot.Lb(1,:);0.110+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;
Robot.L3 = [0.23+Robot.La(1,:);0.17+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L4 = [0.23+Robot.Lb(1,:);0.17+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;

Robot.P1 = [0.23+[-0.0433 -0.0433 -0.03061 -0.03061 ];[0.1110 0.17 0.17 0.1110];0.045+[0 0   0.03061 0.03061 ]]*scale;  
Robot.P2 = [0.23+[-0.03061 -0.03061    0       0   ];[0.1110 0.17 0.17 0.1110];0.045+[ 0.03061 0.03061 0.0433 0.0433]]*scale;  
Robot.P3 = [0.23+[0         0    0.03061    0.03061];[0.1110 0.17 0.17 0.1110];0.045+[0.0433 0.0433 0.03061 0.03061 ]]*scale;  
Robot.P4 = [0.23+[0.03061    0.03061 0.0433 0.0433];[0.1110 0.17 0.17 0.1110];0.045+[0.03061 0.03061    0       0 ]]*scale;
Robot.P5 = [0.23+[0.0433   0.0433   0.03061 0.03061];[0.1110 0.17 0.17 0.1110];0.045+[   0          0   -0.03061  -0.03061]]*scale;
Robot.P6 =[0.23+[0.03061 0.03061      0      0    ];[0.1110 0.17 0.17 0.1110];0.045+[-0.03061  -0.03061 -0.0433 -0.0433]]*scale;
Robot.P7 =[0.23+[0         0 -0.03061 -0.03061   ];[0.1110 0.17 0.17 0.1110];0.045+[ -0.0433 -0.0433 -0.03061 -0.03061]]*scale;
Robot.P8 =[0.23+[-0.03061 -0.03061 -0.0433 -0.0433  ];[0.1110 0.17 0.17 0.1110];0.045+[-0.03061 -0.03061  0     0]]*scale;
        

%%----------------- llanta 2


Robot.L5 = [-0.23+Robot.La(1,:);0.110+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L6 = [-0.23+Robot.Lb(1,:);0.110+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;
Robot.L7 = [-0.23+Robot.La(1,:);0.17+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L8 = [-0.23+Robot.Lb(1,:);0.17+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;

Robot.Pa1 = [-0.23+[-0.0433 -0.0433 -0.03061 -0.03061 ];[0.1110 0.17 0.17 0.1110];0.045+[0 0   0.03061 0.03061 ]]*scale;  
Robot.Pa2 = [-0.23+[-0.03061 -0.03061    0       0   ];[0.1110 0.17 0.17 0.1110];0.045+[ 0.03061 0.03061 0.0433 0.0433]]*scale;  
Robot.Pa3 = [-0.23+[0         0    0.03061    0.03061];[0.1110 0.17 0.17 0.1110];0.045+[0.0433 0.0433 0.03061 0.03061 ]]*scale;  
Robot.Pa4 = [-0.23+[0.03061    0.03061 0.0433 0.0433];[0.1110 0.17 0.17 0.1110];0.045+[0.03061 0.03061    0       0 ]]*scale;
Robot.Pa5 = [-0.23+[0.0433   0.0433   0.03061 0.03061];[0.1110 0.17 0.17 0.1110];0.045+[   0          0   -0.03061  -0.03061]]*scale;
Robot.Pa6 =[-0.23+[0.03061 0.03061      0      0    ];[0.1110 0.17 0.17 0.1110];0.045+[-0.03061  -0.03061 -0.0433 -0.0433]]*scale;
Robot.Pa7 =[-0.23+[0         0 -0.03061 -0.03061   ];[0.1110 0.17 0.17 0.1110];0.045+[ -0.0433 -0.0433 -0.03061 -0.03061]]*scale;
Robot.Pa8 =[-0.23+[-0.03061 -0.03061 -0.0433 -0.0433  ];[0.1110 0.17 0.17 0.1110];0.045+[-0.03061 -0.03061  0     0]]*scale;



%%----------------- llanta 3


Robot.L9 = [-0.23+Robot.La(1,:);-0.110+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L10 = [-0.23+Robot.Lb(1,:);-0.110+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;
Robot.L11 = [-0.23+Robot.La(1,:);-0.17+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L12 = [-0.23+Robot.Lb(1,:);-0.17+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;

Robot.Pb1 = [-0.23+[-0.0433 -0.0433 -0.03061 -0.03061 ];-1*[0.1110 0.17 0.17 0.1110];0.045+[0 0   0.03061 0.03061 ]]*scale;  
Robot.Pb2 = [-0.23+[-0.03061 -0.03061    0       0   ];-1*[0.1110 0.17 0.17 0.1110];0.045+[ 0.03061 0.03061 0.0433 0.0433]]*scale;  
Robot.Pb3 = [-0.23+[0         0    0.03061    0.03061];-1*[0.1110 0.17 0.17 0.1110];0.045+[0.0433 0.0433 0.03061 0.03061 ]]*scale;  
Robot.Pb4 = [-0.23+[0.03061    0.03061 0.0433 0.0433];-1*[0.1110 0.17 0.17 0.1110];0.045+[0.03061 0.03061    0       0 ]]*scale;
Robot.Pb5 = [-0.23+[0.0433   0.0433   0.03061 0.03061];-1*[0.1110 0.17 0.17 0.1110];0.045+[   0          0   -0.03061  -0.03061]]*scale;
Robot.Pb6 =[-0.23+[0.03061 0.03061      0      0    ];-1*[0.1110 0.17 0.17 0.1110];0.045+[-0.03061  -0.03061 -0.0433 -0.0433]]*scale;
Robot.Pb7 =[-0.23+[0         0 -0.03061 -0.03061   ];-1*[0.1110 0.17 0.17 0.1110];0.045+[ -0.0433 -0.0433 -0.03061 -0.03061]]*scale;
Robot.Pb8 =[-0.23+[-0.03061 -0.03061 -0.0433 -0.0433  ];-1*[0.1110 0.17 0.17 0.1110];0.045+[-0.03061 -0.03061  0     0]]*scale;


%%----------------- llanta 4


Robot.L13 = [0.23+Robot.La(1,:);-0.110+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L14 = [0.23+Robot.Lb(1,:);-0.110+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;
Robot.L15 = [0.23+Robot.La(1,:);-0.17+Robot.La(2,:);0.045+Robot.La(3,:)]*scale;
Robot.L16 = [0.23+Robot.Lb(1,:);-0.17+Robot.Lb(2,:);0.045+Robot.Lb(3,:)]*scale;

Robot.Pc1 = [0.23+[-0.0433 -0.0433 -0.03061 -0.03061 ];-1*[0.1110 0.17 0.17 0.1110];0.045+[0 0   0.03061 0.03061 ]]*scale;  
Robot.Pc2 = [0.23+[-0.03061 -0.03061    0       0   ];-1*[0.1110 0.17 0.17 0.1110];0.045+[ 0.03061 0.03061 0.0433 0.0433]]*scale;  
Robot.Pc3 = [0.23+[0         0    0.03061    0.03061];-1*[0.1110 0.17 0.17 0.1110];0.045+[0.0433 0.0433 0.03061 0.03061 ]]*scale;  
Robot.Pc4 = [0.23+[0.03061    0.03061 0.0433 0.0433];-1*[0.1110 0.17 0.17 0.1110];0.045+[0.03061 0.03061    0       0 ]]*scale;
Robot.Pc5 = [0.23+[0.0433   0.0433   0.03061 0.03061];-1*[0.1110 0.17 0.17 0.1110];0.045+[   0          0   -0.03061  -0.03061]]*scale;
Robot.Pc6 =[0.23+[0.03061 0.03061      0      0    ];-1*[0.1110 0.17 0.17 0.1110];0.045+[-0.03061  -0.03061 -0.0433 -0.0433]]*scale;
Robot.Pc7 =[0.23+[0         0 -0.03061 -0.03061   ];-1*[0.1110 0.17 0.17 0.1110];0.045+[ -0.0433 -0.0433 -0.03061 -0.03061]]*scale;
Robot.Pc8 =[0.23+[-0.03061 -0.03061 -0.0433 -0.0433  ];-1*[0.1110 0.17 0.17 0.1110];0.045+[-0.03061 -0.03061  0     0]]*scale;



global Robot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%