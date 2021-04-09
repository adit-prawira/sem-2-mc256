c = 2020;
a = 0;
b = 0;
pairs = "";
for i = 1:c
    for j = 1:c
        if(i < j && i^2+j^2==(c^2-1116^2))
            pairs = sprintf("(a = %d, b = %d)", i, j);
            break;
        end
    end
end
fprintf("%s\n", pairs)