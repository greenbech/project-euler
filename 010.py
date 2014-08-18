"""
Project Euler Problem 10
========================

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""

def primelist(under):
    primesfound = 1
    checkforprime = 3
    liste = [2]

    while liste[-1] < under:
        modprime = 0
        for prime in liste:
            if checkforprime % prime != 0:
                modprime += 1
        if primesfound == modprime:
            liste.append(checkforprime)
            primesfound += 1
        checkforprime += 2
    if liste[-1] >= under:
        del liste[-1]
    return liste

if __name__ == '__main__':
    answer = 1
    for p in primelist(2000000):
        answer += p
    print(answer)
