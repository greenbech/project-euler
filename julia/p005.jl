# Henrik Grønbech

# https://projecteuler.net/problem=5

#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

# Mathematical solution
solution = 2^4*3^2*5*7*11*13*17*19
# println(solution)
#=
Why is this correct? 
The key observation is that number needs to have all the prime factor that are in every number between 1 and 20.
It is not possible to construct a bigger number with this property than the one below.
=#


# Programmers solution
function factorize(n)
    factors = Dict{Int64, Int64}()
    i = 1
    while n > 1
        i += 1
        if n % i == 0
            if i in keys(factors)
                factors[i] += 1
            else
                factors[i] = 1
            end
            # @info factors n i
            n = div(n, i)
            i = 1
        end
    end
    return factors
end

@assert factorize(25)[5] == 2
@assert factorize(101)[101] == 1
@assert factorize(20736)[3] == 4
@assert factorize(20736)[2] == 8
@assert !(1 in keys(factorize(20736)))


function combinefactors(factordict)
    factors = Dict{Int64, Int64}()
    for f = factordict
        for v in keys(f)
            if v in keys(factors)
                factors[v] = max(factors[v], f[v])
            else
                factors[v] = f[v]
            end
        end
    end
    return factors
end

@assert combinefactors([Dict(3=>3), Dict(3=>4)])[3] == 4
@assert length(keys(combinefactors([Dict(3=>3), Dict(3=>4, 2=>1), Dict(7=>5)]))) == 3

function main()
    divisors = 1:20
    allfactors = [factorize(i) for i = divisors]
    factors = combinefactors(allfactors)
    @info "factors" factors

    solution::BigInt = 1
    for x in factors
        solution *= x[1]^x[2]
    end
    return solution
end


println(main())