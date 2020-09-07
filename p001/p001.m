% Henrik Grønbech
% https://projecteuler.net/problem=1

%{
Project Euler Problem 1
=======================

If we list all the natural numbers below 10 that are multiples of 3 or 5, 
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
%}

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
