function [Kc,Kd,tauf]=PDplace(a1,a0,b1,b0,Acl);
ac_2=Acl(2);  
ac_1=Acl(3);   
ac_0=Acl(4);    
%for Sylvester matrix
S_matrix=[1 b1 0; a1 b0 b1; a0 0 b0];
Vec=[ac_2-a1;ac_1-a0;ac_0];
contr_p=inv(S_matrix)*Vec;
L0=contr_p(1); 
p1=contr_p(2);
p0=contr_p(3);
%PID controller parameters
tauf=1/L0;
Kc=p0/L0;
Kd=p1/L0-p0/L0^2;
