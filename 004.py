"""
Project Euler Problem 4
=======================

A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 * 99.

Find the largest palindrome made from the product of two 3-digit numbers.
"""

def speilTall(n):
    n = str(n)
    return int(n + n[::-1])

if __name__ == '__main__':

    faktorer = []
    a = 2
    b = 999
    c = speilTall(b)

    while len(faktorer) != 2 or c != 1:
        faktorer = []
        c = speilTall(b)
        for i in range(1000,100,-1):
            while c % i == 0:
                faktorer.append(i)
                c = c // i
        b -= 1

    svar = 1
    for i in faktorer:
        svar *= i
    print(svar)
