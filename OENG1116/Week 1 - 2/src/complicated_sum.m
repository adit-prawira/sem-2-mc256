
sum = 0;

for n = 9:1000000
    sum = sum + (10000/(((n+1)*sqrt(n)) + (n*sqrt(n+1))));
end

