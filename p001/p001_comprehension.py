# Henrik Grønbech; https://projecteuler.net/problem=1

# One-liner
def sum_multiples(upper, mult0, mult1):
    return sum((i for i in range(upper) if i % mult0 == 0 or i % mult1 == 0))


if __name__ == "__main__":
    print(sum_multiples(1000, 3, 5))
