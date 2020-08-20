# Henrik Grønbech

# https://projecteuler.net/problem=4

#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

ispalindrome(n) = string(n) == reverse(string(n))

@assert ispalindrome(9) "9 is a palindrome"
@assert ispalindrome(1111) "1111 is a palindrome"
@assert ispalindrome(11011) "11011 is a palindrome"
@assert ispalindrome(1234567890987654321) "1234567890987654321 is a palindrome"
@assert !ispalindrome(123123) "123123 is not a palindrome"


function main()
    numbers = sort([i*j for i in 100:999 for j in i:999], rev=true)
    palindromes = filter(p->ispalindrome(p), numbers)
    @info length(palindromes)
    # @info palindromes
    println(palindromes[1])
end


@time main()