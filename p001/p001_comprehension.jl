# Henrik Grønbech
# https://projecteuler.net/problem=1

#=
Project Euler Problem 1
=======================

If we list all the natural numbers below 10 that are multiples of 3 or 5, 
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=#

function sum_multiples(upper, mult1, mult2)
    return sum([i for i=1:upper-1 if i % mult1 == 0 || i % mult2 == 0])
end


println(sum_multiples(10000, 3, 5))
