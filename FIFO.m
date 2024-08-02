function table = FIFO(q,sizeS)
N = size(q,2);
table = strings([sizeS+1,N]);
table(1,:) = q;


pages = strings(sizeS,1);

if N == 0
    fprintf("fault = 0 ");
elseif N <= sizeS
    current = 3;
    table(2,1) = table(1,1);
    for i = 2 : N
        table(2:current-1,i) = table(2:current-1,i-1);
        table(current,i) = table(1,i);
        current = current + 1;
    end
else
    current = 3;
    table(2,1) = table(1,1);
    pages(1) = table(1,1);
    for i = 2 : sizeS
        table(2:current-1,i) = pages(1:current-2);
        table(current,i) = table(1,i);
        pages(current-1) = table(1,i);
        current = current + 1;
    end
    current = 2;
    for i = sizeS+1 : N
        table(2:end,i) = pages;

        if sum(table(2:end,i) == table(1,i) ) > 0
            table(2:end,i) = "hit";
            %             table([1<0;table(2:end,i) == table(1,i)],i) = "hit";
        else
            table(current,i) = table(1,i);
            pages(current-1) = table(1,i);
            current = current + 1;
        end
        if(current>sizeS+1)
            current =2;
        end
    end
end
end