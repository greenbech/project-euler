# Henrik Grønbech; https://projecteuler.net/problem=2

function fib(n, dynamic_table)
    if n <= 2
        return n
    elseif haskey(dynamic_table, n)
        return dynamic_table[n]
    end

    fib_n = fib(n-1, dynamic_table) + fib(n-2, dynamic_table)
    dynamic_table[n] = fib_n
    return fib_n
end


function main()
    fib_n = 1
    n = 1
    total = 0
    dynamic_table = Dict{Int32,Int32}()
    while fib_n <= 4000000
        fib_n = fib(n, dynamic_table)
        if fib_n % 2 == 0
            total += fib_n
        end
        n += 1
    end

    println(total)
end

main()
