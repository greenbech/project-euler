"""
Project Euler Problem 1
=======================

If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

def antallSumDelelig(mod1, mod2, ovregrense):
    """
    Retunerer summen av tall tallene delelig pa 'mod1' og 'mod2'
    under 'ovregrense'.
    """
    deleligeTall = []
    for i in range(ovregrense):
        if (i % mod1 == 0) != (i % mod2 == 0):
            deleligeTall.append(i)
        elif i % (mod1 * mod2) == 0:
            deleligeTall.append(i)
    return sum(deleligeTall)

if __name__ == "__main__":
    print(antallSumDelelig(3,5,1000))
