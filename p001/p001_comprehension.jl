# Henrik Grønbech; https://projecteuler.net/problem=1

function sum_multiples(upper, mult1, mult2)
    return sum([i for i=1:upper-1 if i % mult1 == 0 || i % mult2 == 0])
end


println(sum_multiples(1000, 3, 5))
