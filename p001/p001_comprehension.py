# Henrik Grønbech
# https://projecteuler.net/problem=1

"""
Project Euler Problem 1
=======================

If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

# One-liner
def sum_multiples(upper, mult0, mult1):
    return sum((i for i in range(upper) if i % mult0 == 0 or i % mult1 == 0))


if __name__ == "__main__":
    print(sum_multiples(1000, 3, 5))
