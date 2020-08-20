# Henrik Grønbech

# https://projecteuler.net/problem=1

#=
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=#

# Naïve implementation
function sum_multiples(from, to, mult...)
    sum = 0
    for i = from:to
        for m in mult
            if i % m == 0
                sum += i
                break
            end
        end
    end
    return sum
end


# One-liner; List comprehension
function sum_multiples_list_comprehension(from, to, mult...)
    return sum([i for i in from:to for m in mult if i % m == 0])
end


# println(sum_multiples(1, 999, 3, 5))
println(sum_multiples_list_comprehension(1, 999, 3, 5))
