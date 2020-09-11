# Henrik Grønbech; https://projecteuler.net/problem=3

function main()
    n = 600851475143;
    biggest_factor = 2;

    while n > 1
        for i = biggest_factor:(mod(biggest_factor, 2)+1):n
            if mod(n, i) == 0
                n = n ÷ i;
                biggest_factor = i;
                break
            end
        end
    end

    println(biggest_factor);
end

main()
