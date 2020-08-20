# Henrik Grønbech

# https://projecteuler.net/problem=1

#=
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=#


function sum_multiples(upper, mult...)
    sum = 0
    for i = 1:upper-1
        for m in mult
            if i % m == 0
                sum += i
                break
            end
        end
    end
    return sum
end


println(sum_multiples(1000, 3, 5))
