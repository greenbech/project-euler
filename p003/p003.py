# Henrik Grønbech; https://projecteuler.net/problem=3
import time

def main():
    n = 600851475143
    
    biggest_factor = 2
    while n > 1:
        for i in range(biggest_factor, n+1, biggest_factor % 2 + 1):
            if n % i == 0:
                n = n // i
                biggest_factor = i
                break
    
    print(biggest_factor)


if __name__ == '__main__':
    main()
