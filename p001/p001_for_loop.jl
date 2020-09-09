# Henrik Grønbech; https://projecteuler.net/problem=1

function sum_multiples(upper, mult1, mult2)
    sum = 0
    for i = 1:upper-1
        if i % mult1 == 0 || i % mult2 == 0
            sum += i
        end
    end
    return sum
end


println(sum_multiples(1000, 3, 5))
