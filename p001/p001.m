function p001()
    display(sum_multiples(999, 3, 5))
end

function total = sum_multiples(upper, mult1, mult2)
    total = 0;

    for i = 1:upper
        if mod(i,mult1) == 0 || mod(i,mult2) == 0
            total = total + i;
        end
    end
end
