% Henrik Grønbech; https://projecteuler.net/problem=2

function total = p002_iterative()
    n0 = 1;
    n1 = 2;
    total = 0;

    while n1 < 4000000
        if mod(n1, 2) == 0
            total = total + n1;
        end
        tmp = n1;
        n1 = n0 + n1;
        n0 = tmp;
    end

    printf("%d\n", total)
end
