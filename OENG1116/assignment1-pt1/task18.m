%% s3859061
a = 0;
c = 0;
b = 2020;
messages = "";
found = 0;
for i = 1:10000
    for j = 1:10000
        if(i < b && i < j && j > b && (i^2+b^2==j^2))
            a = i;
            c = j;
            messages = sprintf("a = %d, c = %d\n", a,c);
            found = 1;
            break;
        end    
        if(found == 1)
            fprintf("%$d", found);
        break;
    end
    end
    
    
end

fprintf("%s\n", messages);