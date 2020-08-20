# Henrik Grønbech

# https://projecteuler.net/problem=3

#=
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
=#

function largest_factor(n)
    originaln = n
    i = 1
    factors = []
    while n > 1
        i += 1
        if n % i == 0
            n /= i
            push!(factors, i)
            i = 1
        end
    end
    
    # Verifying that we have done thing correctly
    @info originaln, factors
    @assert prod(factors) == originaln
    
    return maximum(factors)
end


 println(largest_factor(600851475143))