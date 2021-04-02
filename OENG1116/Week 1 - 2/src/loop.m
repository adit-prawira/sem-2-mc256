sum = 0;

for i = 1:1000
    fprintf("%d",i);
    sum = sum + (i^2/2^i);
end

