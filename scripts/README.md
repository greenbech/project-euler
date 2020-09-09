#  Scripts for checking corretness and running benchmarks

Here I provide some scripts for making the development process easier. The scripts are written with the (relatively new) runtime for Javascript/Typescript *Deno*. 

Deno makes writing scripts with dependencies fun and easy because you just need to specify the URL when importing—there is no need to set up a project! It also include the `deno install` command which is handy 🤘

## `pecheck.ts`

`pecheck.ts` (read: Project Euler check) assures that
- all the source files has `pXXX` as prefix
- includes the line `Henrik Grønbech; https://projecteuler.net/problem=X`
- most importantly, gives the result as in the file `answers.txt` (that you must provide in each problem folder)

I recommend you to install it with
```bash
deno install -f -A --unstable pecheck.ts
```

## `pebenchmark.ts`

`pebenchmark.ts` (read: Project Euler benchmark) calculates the executions time for each problem and prints a markdown table to stdout. Currently you have to the copy-paste to the README.md manually (the first time you can run `pebenchmark p001 >> p001/README.md`), but you have to do some cleaning in the README if you have done this before 😩


Again, I recommend you to install it with
```bash
deno install -f -A --unstable pebenchmark.ts
```

###### Why prefix the scripts ps? This makes autocompletion in the shell much easier. Just type pe[\tab] and you find all the scripts easily 🎉
