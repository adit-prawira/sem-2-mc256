clear 
clc
close all 
a = 3;
r = 0.75;
n = 100;
sum = 0;
for i = 0:n
    if(rem(i, 3) == 0)
        sum = sum + i;
    end
    
end
