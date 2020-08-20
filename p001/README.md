# Problem 1: Multiples of 3 and 5

## Problem description

```
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
```

## Solution

As the first task, this is probably the easiest one. The most natural solution is to iterate through the natural numbers up to 999 and sum all that are divisible by 3 or 5. 

An other solution is to sum all the multiples of 3 and the multiples of 5, but then you will need to remove the multiples of 15 since those would be counted twice.

In both cases, this is mostly a matter of knowing the syntax of a for loop (or list comprehension in a language such as Python) and the `mod` operator.
