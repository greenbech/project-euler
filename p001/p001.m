% Henrik Grønbech; https://projecteuler.net/problem=1

function p001()
    printf("%d\n", sum_multiples(1000, 3, 5))
end

function total = sum_multiples(upper, mult1, mult2)
    total = 0;

    for i = 1:upper-1
        if mod(i,mult1) == 0 || mod(i,mult2) == 0
            total = total + i;
        end
    end
end
