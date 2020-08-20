"""
Project Euler Problem 9
=======================

A Pythagorean triplet is a set of three natural numbers, a < b < c, for
which,
                             a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
"""

from math import sqrt

def pyth(a,b):
    c = a**2 + b**2
    c = sqrt(c)
    if c // 1 == c / 1:
        return int(c)
    else:
        return c

def summer(x1,x2,x3):
    return x1 + x2 + x3

a = 1
b = a + 1
c = pyth(a,b)

while a + b <= 1000:
    b = a + 1
    c = pyth(a,b)
##    if c // 1 == c / 1:
##        print(a,b,c)
    if summer(a,b,c) == 1000:
        losning = a * b * c
    while a + b < 1000:
        c = pyth(a,b)
##        if c // 1 == c / 1:
##            print(a,b,c)
        if summer(a,b,c) == 1000:
            losning = a * b * c
        b += 1
    a += 1
    b = a + 1

print(losning)
