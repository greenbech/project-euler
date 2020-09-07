# [Problem 1: Multiples of 3 and 5](https://projecteuler.net/problem=1)

## Problem description

```
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
```

## Solution

As the first task on the site, this is probably the easiest. A straight forward solution is to

- initialize a variable `total` to 0
- iterate through the numbers from 1 to 999 with a for loop
- add the numbers that are divisible by 3 *or* divisible by 5 to `total`

An other solution is to sum all the multiples of 3 and the multiples of 5, but then you will need to remove the multiples of 15 since those would be counted twice.

In a language such as Python you can solve this problem on one line with the built in function `sum` and the use of comprehension expression:

```python
sum((i for i in range(1000) if i % 3 == 0 or i % 5 == 0))
```
