"""
Project Euler Problem 3
=======================

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
"""

def primtallFaktorer(n):
    """
    Retunerer en liste med primtallfaktorene til n
    """

    a = 2
    faktorer = []

    while (n % a == 0):
        faktorer.append(a)
        n = n // a

    a = 3

    while n > 1:
        while n % a == 0:
            faktorer.append(a)
            n = n // a
        a += 2

    return faktorer

if __name__ == '__main__':
    print(max(primtallFaktorer(600851475143)))
