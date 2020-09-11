# [Problem 3: Largest prime factor](https://projecteuler.net/problem=3)

## Problem description

```
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
```

## Solution

The first approach you might think about is to divide 600851475143 (from now `n`) by all the integers up to that `n` and see if the rest is zero. Then you will find all the divisors of `n`. The first trick here is that you only need to divide up to the square root of `n`. This is because there cannot be any divisors between `sqrt(n)` and `n` (try to think about that!). However, you now have a new problem—you have to find out which of the divisors that are primes.

The more clever approach is to first find the smallest prime factor of `n` and then divide `n` by that number. You can repeat that until `n` is one and the last number you divided by must be the smallest prime factor.

## Benchmark

| Programming language | File                 | Duration (ms) |
| :------------------- | :------------------- | ------------: |
| Python               | [p003.py](./p003.py) |            47 |
| Julia                | [p003.jl](./p003.jl) |           286 |
| MATLAB/GNU Octave    | [p003.m](./p003.m)   |           352 |
