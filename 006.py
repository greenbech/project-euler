"""
Project Euler Problem 6
=======================

The sum of the squares of the first ten natural numbers is,
                       1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
                    (1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten
natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one
hundred natural numbers and the square of the sum.
"""

# Summen av de 100 forste tallene
sumHundre = 0
for i in range(1,101):
    sumHundre += i

kvadratSum = sumHundre**2

# Summen av de 100 forste kvadrattallene
kvadratHundre = 0
for i in range(1,101):
    kvadratHundre += i**2

# Differanse mellom summen kvadrert og kvadrattallene
differanse = kvadratSum - kvadratHundre

print(differanse)
