function P3DX = Robot_Plot_3D(x,y,phi,color,color2)

global Robot

% ROBOT_PLOT_3D plotes the "Pioneer" robot in the framework with the pose
%     established on input parameters. This function is used during 
%     simulation to show the robot behavior in the space work.
%     
%     P3DX = Robot_Plot_3D(x,y,phi,color)
%     
%     x,y,phi = robot pose
%     color = color used to represent the robot. Default: 'b' or [0 0 1].

if nargin < 4
    color = [1 .8 0.1];
    color2 = [.3 .3 .3];
    color3 = [1 .5 0];
end

%%% Matriz de Rotacao
Rot = [cos(phi) -sin(phi) 0; sin(phi) cos(phi) 0; 0 0 1];

%cara inferior
 Cir1 = Rot*Robot.Ci1;
 Cir2 = Rot*Robot.Ci2;
 Cir3 = Rot*Robot.Ci3;
 %cara superior
 Csr1 = Rot*Robot.Cs1;
 Csr2 = Rot*Robot.Cs2;
 Csr3 = Rot*Robot.Cs3;
%tapas
 FT1 = Rot*Robot.T1;
 FT2 = Rot*Robot.T2;
 FT3 = Rot*Robot.T3;
 FT4 = Rot*Robot.T4;
 FT5 = Rot*Robot.T5;
 FT6 = Rot*Robot.T6;
 FT7 = Rot*Robot.T7;
 FT8 = Rot*Robot.T8;
 FT9 = Rot*Robot.T9;
 FT10 = Rot*Robot.T10;
 FT11 = Rot*Robot.T11;
 FT12 = Rot*Robot.T12;
 FT13 = Rot*Robot.T13;
 FT14 = Rot*Robot.T14;
 FT15 = Rot*Robot.T15;
 FT16 = Rot*Robot.T16;
 FT17 = Rot*Robot.T17;
 FT18 = Rot*Robot.T18;
 FT19 = Rot*Robot.T19;
 FT20 = Rot*Robot.T20;
 FT21 = Rot*Robot.T21;
 FT22 = Rot*Robot.T22;
 FT23 = Rot*Robot.T23;
 FT24 = Rot*Robot.T24;
 FT25 = Rot*Robot.T25;
 FT26 = Rot*Robot.T26;
 FT27 = Rot*Robot.T27;
 FT28 = Rot*Robot.T28;
 FT29 = Rot*Robot.T29;
 FT30 = Rot*Robot.T30;
 FT31 = Rot*Robot.T31;
 FT32 = Rot*Robot.T32;

% LLANTAS

FL1 = Rot*Robot.L1;
FL2 = Rot*Robot.L2;
FL3 = Rot*Robot.L3;
FL4 = Rot*Robot.L4;
FP1 = Rot*Robot.P1;
FP2 = Rot*Robot.P2;
FP3 = Rot*Robot.P3;
FP4 = Rot*Robot.P4;
FP5 = Rot*Robot.P5;
FP6 = Rot*Robot.P6;
FP7 = Rot*Robot.P7;
FP8 = Rot*Robot.P8;
% llanta 2
FL5 = Rot*Robot.L5;
FL6 = Rot*Robot.L6;
FL7 = Rot*Robot.L7;
FL8 = Rot*Robot.L8;
FPa1 = Rot*Robot.Pa1;
FPa2 = Rot*Robot.Pa2;
FPa3 = Rot*Robot.Pa3;
FPa4 = Rot*Robot.Pa4;
FPa5 = Rot*Robot.Pa5;
FPa6 = Rot*Robot.Pa6;
FPa7 = Rot*Robot.Pa7;
FPa8 = Rot*Robot.Pa8;
% llanta 3
FL9 = Rot*Robot.L9;
FL10 = Rot*Robot.L10;
FL11 = Rot*Robot.L11;
FL12 = Rot*Robot.L12;
FPb1 = Rot*Robot.Pb1;
FPb2 = Rot*Robot.Pb2;
FPb3 = Rot*Robot.Pb3;
FPb4 = Rot*Robot.Pb4;
FPb5 = Rot*Robot.Pb5;
FPb6 = Rot*Robot.Pb6;
FPb7 = Rot*Robot.Pb7;
FPb8 = Rot*Robot.Pb8;
% llanta 4
FL13 = Rot*Robot.L13;
FL14 = Rot*Robot.L14;
FL15 = Rot*Robot.L15;
FL16 = Rot*Robot.L16;
FPc1 = Rot*Robot.Pc1;
FPc2 = Rot*Robot.Pc2;
FPc3 = Rot*Robot.Pc3;
FPc4 = Rot*Robot.Pc4;
FPc5 = Rot*Robot.Pc5;
FPc6 = Rot*Robot.Pc6;
FPc7 = Rot*Robot.Pc7;
FPc8 = Rot*Robot.Pc8;




%cara inferior
P3DX(1)  = patch(Cir1(1,:) +x, Cir1(2,:) +y, Cir1(3,:),  color3);
P3DX(2)  = patch(Cir2(1,:) +x, Cir2(2,:) +y, Cir2(3,:),  color2);
P3DX(3)  = patch(Cir3(1,:) +x, Cir3(2,:) +y, Cir3(3,:),  color3);
%cara superior
P3DX(4)  = patch(Csr1(1,:) +x, Csr1(2,:) +y, Csr1(3,:),  color3);
P3DX(5)  = patch(Csr2(1,:) +x, Csr2(2,:) +y, Csr2(3,:),  color2);
P3DX(6)  = patch(Csr3(1,:) +x, Csr3(2,:) +y, Csr3(3,:),  color3);


%tapas


P3DX(7)  = patch(FT1(1,:) +x, FT1(2,:) +y, FT1(3,:),  color3);
P3DX(8)  = patch(FT2(1,:) +x, FT2(2,:) +y, FT2(3,:),  color3);
P3DX(9)  = patch(FT3(1,:) +x, FT3(2,:) +y, FT3(3,:),  color3);
P3DX(10)  = patch(FT4(1,:) +x, FT4(2,:) +y, FT4(3,:),  color3);
P3DX(11)  = patch(FT5(1,:) +x, FT5(2,:) +y, FT5(3,:),  color3);
P3DX(12)  = patch(FT6(1,:) +x, FT6(2,:) +y, FT6(3,:),  color3);
P3DX(13)  = patch(FT7(1,:) +x, FT7(2,:) +y, FT7(3,:),  color3);
P3DX(14)  = patch(FT8(1,:) +x, FT8(2,:) +y, FT8(3,:),  color2);
P3DX(15)  = patch(FT9(1,:) +x, FT9(2,:) +y, FT9(3,:),  color2);
P3DX(16)  = patch(FT10(1,:) +x, FT10(2,:) +y, FT10(3,:),  color2);
P3DX(17)  = patch(FT11(1,:) +x, FT11(2,:) +y, FT11(3,:),  color2);
P3DX(18)  = patch(FT12(1,:) +x, FT12(2,:) +y, FT12(3,:),  color2);
P3DX(19)  = patch(FT13(1,:) +x, FT13(2,:) +y, FT13(3,:),  color2);
P3DX(20)  = patch(FT14(1,:) +x, FT14(2,:) +y, FT14(3,:),  color2);
P3DX(21)  = patch(FT15(1,:) +x, FT15(2,:) +y, FT15(3,:),  color2);
P3DX(22)  = patch(FT16(1,:) +x, FT16(2,:) +y, FT16(3,:),  color2);
P3DX(23)  = patch(FT17(1,:) +x, FT17(2,:) +y, FT17(3,:),  color2);
P3DX(24)  = patch(FT18(1,:) +x, FT18(2,:) +y, FT18(3,:),  color2);
P3DX(25)  = patch(FT19(1,:) +x, FT19(2,:) +y, FT19(3,:),  color2);
P3DX(26)  = patch(FT20(1,:) +x, FT20(2,:) +y, FT20(3,:),  color2);
P3DX(27)  = patch(FT21(1,:) +x, FT21(2,:) +y, FT21(3,:),  color2);
P3DX(28)  = patch(FT22(1,:) +x, FT22(2,:) +y, FT22(3,:),  color2);
P3DX(29)  = patch(FT23(1,:) +x, FT23(2,:) +y, FT23(3,:),  color2);
P3DX(30)  = patch(FT24(1,:) +x, FT24(2,:) +y, FT24(3,:),  color3);
P3DX(31)  = patch(FT25(1,:) +x, FT25(2,:) +y, FT25(3,:),  color3);
P3DX(32)  = patch(FT26(1,:) +x, FT26(2,:) +y, FT26(3,:),  color3);
P3DX(33)  = patch(FT27(1,:) +x, FT27(2,:) +y, FT27(3,:),  color3);
P3DX(34)  = patch(FT28(1,:) +x, FT28(2,:) +y, FT28(3,:),  color3);
P3DX(35)  = patch(FT29(1,:) +x, FT29(2,:) +y, FT29(3,:),  color3);
P3DX(36)  = patch(FT30(1,:) +x, FT30(2,:) +y, FT30(3,:),  color3);
P3DX(37)  = patch(FT31(1,:) +x, FT31(2,:) +y, FT31(3,:),  color3);
P3DX(38)  = patch(FT32(1,:) +x, FT32(2,:) +y, FT32(3,:),  color3);


% LLANTAS
P3DX(39)  = patch(FL1(1,:) +x, FL1(2,:) +y, FL1(3,:),  color);
P3DX(40)  = patch(FL2(1,:) +x, FL2(2,:) +y, FL2(3,:),  color2);
P3DX(41)  = patch(FL3(1,:) +x, FL3(2,:) +y, FL3(3,:),  color);
P3DX(42)  = patch(FL4(1,:) +x, FL4(2,:) +y, FL4(3,:),  color2);

P3DX(43)  = patch(FP1(1,:) +x, FP1(2,:) +y, FP1(3,:),  color2);
P3DX(44)  = patch(FP2(1,:) +x, FP2(2,:) +y, FP2(3,:),  color2);
P3DX(45)  = patch(FP3(1,:) +x, FP3(2,:) +y, FP3(3,:),  color2);
P3DX(46)  = patch(FP4(1,:) +x, FP4(2,:) +y, FP4(3,:),  color2);
P3DX(47)  = patch(FP5(1,:) +x, FP5(2,:) +y, FP5(3,:),  color2);
P3DX(48)  = patch(FP6(1,:) +x, FP6(2,:) +y, FP6(3,:),  color2);
P3DX(49)  = patch(FP7(1,:) +x, FP7(2,:) +y, FP7(3,:),  color2);
P3DX(50)  = patch(FP8(1,:) +x, FP8(2,:) +y, FP8(3,:),  color2);

% LLANTAS  2
P3DX(51)  = patch(FL5(1,:) +x, FL5(2,:) +y, FL5(3,:),  color);
P3DX(52)  = patch(FL6(1,:) +x, FL6(2,:) +y, FL6(3,:),  color2);
P3DX(53)  = patch(FL7(1,:) +x, FL7(2,:) +y, FL7(3,:),  color);
P3DX(54)  = patch(FL8(1,:) +x, FL8(2,:) +y, FL8(3,:),  color2);

P3DX(55)  = patch(FPa1(1,:) +x, FPa1(2,:) +y, FPa1(3,:),  color2);
P3DX(56)  = patch(FPa2(1,:) +x, FPa2(2,:) +y, FPa2(3,:),  color2);
P3DX(57)  = patch(FPa3(1,:) +x, FPa3(2,:) +y, FPa3(3,:),  color2);
P3DX(58)  = patch(FPa4(1,:) +x, FPa4(2,:) +y, FPa4(3,:),  color2);
P3DX(59)  = patch(FPa5(1,:) +x, FPa5(2,:) +y, FPa5(3,:),  color2);
P3DX(60)  = patch(FPa6(1,:) +x, FPa6(2,:) +y, FPa6(3,:),  color2);
P3DX(61)  = patch(FPa7(1,:) +x, FPa7(2,:) +y, FPa7(3,:),  color2);
P3DX(62)  = patch(FPa8(1,:) +x, FPa8(2,:) +y, FPa8(3,:),  color2);
% LLANTAS  3
P3DX(63)  = patch(FL9(1,:) +x, FL9(2,:) +y, FL8(3,:),  color);
P3DX(64)  = patch(FL10(1,:) +x, FL10(2,:) +y, FL10(3,:),  color2);
P3DX(65)  = patch(FL11(1,:) +x, FL11(2,:) +y, FL11(3,:),  color);
P3DX(66)  = patch(FL12(1,:) +x, FL12(2,:) +y, FL12(3,:),  color2);
P3DX(67)  = patch(FPb1(1,:) +x, FPb1(2,:) +y, FPb1(3,:),  color2);
P3DX(68)  = patch(FPb2(1,:) +x, FPb2(2,:) +y, FPb2(3,:),  color2);
P3DX(69)  = patch(FPb3(1,:) +x, FPb3(2,:) +y, FPb3(3,:),  color2);
P3DX(70)  = patch(FPb4(1,:) +x, FPb4(2,:) +y, FPb4(3,:),  color2);
P3DX(71)  = patch(FPb5(1,:) +x, FPb5(2,:) +y, FPb5(3,:),  color2);
P3DX(72)  = patch(FPb6(1,:) +x, FPb6(2,:) +y, FPb6(3,:),  color2);
P3DX(73)  = patch(FPb7(1,:) +x, FPb7(2,:) +y, FPb7(3,:),  color2);
P3DX(74)  = patch(FPb8(1,:) +x, FPb8(2,:) +y, FPb8(3,:),  color2);


% LLANTAS  4
P3DX(75)  = patch(FL13(1,:) +x, FL13(2,:) +y, FL13(3,:),  color);
P3DX(76)  = patch(FL14(1,:) +x, FL14(2,:) +y, FL14(3,:),  color2);
P3DX(77)  = patch(FL15(1,:) +x, FL15(2,:) +y, FL15(3,:),  color);
P3DX(78)  = patch(FL16(1,:) +x, FL16(2,:) +y, FL16(3,:),  color2);
P3DX(79)  = patch(FPc1(1,:) +x, FPc1(2,:) +y, FPc1(3,:),  color2);
P3DX(80)  = patch(FPc2(1,:) +x, FPc2(2,:) +y, FPc2(3,:),  color2);
P3DX(81)  = patch(FPc3(1,:) +x, FPc3(2,:) +y, FPc3(3,:),  color2);
P3DX(82)  = patch(FPc4(1,:) +x, FPc4(2,:) +y, FPc4(3,:),  color2);
P3DX(83)  = patch(FPc5(1,:) +x, FPc5(2,:) +y, FPc5(3,:),  color2);
P3DX(84)  = patch(FPc6(1,:) +x, FPc6(2,:) +y, FPc6(3,:),  color2);
P3DX(85)  = patch(FPc7(1,:) +x, FPc7(2,:) +y, FPc7(3,:),  color2);
P3DX(86)  = patch(FPc8(1,:) +x, FPc8(2,:) +y, FPc8(3,:),  color2);




  xlabel('x [m]'); ylabel('y [m]'); zlabel('z [m]');
    