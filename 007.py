"""
Project Euler Problem 7
=======================

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.

What is the 10001st prime number?
"""

def primtall(n):
    primesfound = 1
    checkforprime = 3
    primelist = [1]*n
    primelist[0] = 2

    if n <= 0:
        return "Error"

    while primelist[-1] == 1:
        modprime = 0
        for i in range(primesfound):
            if checkforprime % primelist[i] != 0:
                modprime += 1
        if modprime == primesfound:
            primelist[primesfound] = checkforprime
            primesfound += 1
        checkforprime += 2
    return primelist[-1]

if __name__ == '__main__':
    print(primtall(10001))
