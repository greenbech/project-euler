% Henrik Grønbech
% https://projecteuler.net/problem=2

%{
Project Euler Problem 2
=======================

Each new term in the Fibonacci sequence is generated by adding the
previous two terms. By starting with 1 and 2, the first 10 terms will be:

                  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

Find the sum of all the even-valued terms in the sequence which do not
exceed four million.
%}

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
