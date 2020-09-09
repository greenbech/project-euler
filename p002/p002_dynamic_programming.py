# Henrik Grønbech; https://projecteuler.net/problem=2

def fib(n, dynamic_table):
    if n <= 2:
        return n
    if n in dynamic_table:
        return dynamic_table[n]
    fib_n = fib(n-1, dynamic_table) + fib(n-2, dynamic_table)
    dynamic_table[n] = fib_n
    return fib_n

def main():
    fib_n = 1
    n = 1
    total = 0
    dynamic_table = {}

    while fib_n <= 4000000:
        fib_n = fib(n, dynamic_table)
        if fib_n % 2 == 0:
            total += fib_n
        n += 1

    print(total)

if __name__ == "__main__":
    main()
