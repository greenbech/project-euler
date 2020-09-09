# Henrik Grønbech; https://projecteuler.net/problem=2

def main():
    n0, n1 = 1, 2
    total = 0
    while n1 <= 4000000:
        if n1 % 2 == 0:
            total += n1
        n0, n1 = n1, n0 + n1

    print(total)

if __name__ == "__main__":
    main()
