function [Kc,tauI,tauD,tauf]=pidplace(a1,a0,b1,b0,Acl);
%pole-assignment controller design
ac_3=Acl(2);  %changed the coefficient
ac_2=Acl(3);  %changed the coefficient 
ac_1=Acl(4);  %changed the coefficient  
ac_0=Acl(5);  %changed the coefficient 
%for Sylvester matrix
S_matrix=[1 b1 0 0; a1 b0 b1 0; a0 0 b0 b1; 0 0 0 b0];
Vec=[ac_3-a1;ac_2-a0;ac_1;ac_0];
contr_p=inv(S_matrix)*Vec;
L0=contr_p(1); 
c2=contr_p(2);
c1=contr_p(3);
c0=contr_p(4);
%PID controller parameters
tauf=1/L0;
tauI=c1/c0-tauf;
%Kc=c1*c0/L0-c0/L0^2;
Kc=tauI*tauf*c0;
tauD=(c2*tauI*tauf-Kc*tauI*tauf)/(Kc*tauI);
