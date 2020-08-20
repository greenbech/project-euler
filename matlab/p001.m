function tot = p001()
    display(sum_multiples(1, 999, 3, 5))
end

function tot = sum_multiples(from, to, mult1, mult2)
    tot = 0;

    for i = from:to
        if mod(i,mult1) == 0 || mod(i,mult2) == 0
            tot = tot + i;
        end
    end
end
