# Activity 3.1 - Regular languages

Reference for math symbols:
https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols

## Names:
- Mariel Gómez, A01275607
- Santiago Rodríguez, A01025232


## Exercises:

1. Let $X$ be a finite set. Give a recursive definition of the set of subsets of $X$ (the Power set of $X$) $P(X)$. Use union as the operator on the definition

    _**SOLUTION:**_


I. **Basis**: $\{\} \in P(X)$

II. **Recursive Step**: If $n \in X$ and $ S \in P(X)$ then $\{n\} \cup S \in P(X)$

III.**Closure Step** : $\{n\} \cup S \in P(X)$ only if it can be obtained from the base case using a finite number of applications of the recursive step.

2. Prove by induction on $n$ that:

    $\sum_{i=0}^{n}i^3 = \frac{n^2(n+1)^2}{4}$

    _**SOLUTION:**_


I. **Basis**:  if $n = 0$ then  $ \frac{0^2(0+1)^2}{4} = \frac{0}{4} = 0$

II. **Inductive Hypothesis**: If $n = k$ then it holds that $\sum_{i=0}^{k}i^3 = \frac{k^2(k+1)^2}{4}$

III.**Inductive Step**: For $n = (k+1)$

$\sum_{i=0}^{(k+1)}i^3 = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\sum_{i=0}^{k}i^3 + (k+1)^3 = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{k^2(k+1)^2}{4} + (k+1)^3 = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{k^2(k+1)^2}{4} + \frac{4(k+1)^3}{4} = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{k^2(k+1)^2 + 4(k+1)^3 }{4}  = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{k^2(k+1)^2 + 4(k+1)^2(k+1) }{4}  = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{(k+1)^2 (k^2+4(k+1))}{4}  = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{(k+1)^2 (k^2+4k+4)}{4}  = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{(k+1)^2 (k+2)^2}{4}  = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\frac{(k+1)^2((k+1)+1)^2}{4}  = \frac{(k+1)^2((k+1)+1)^2}{4}$

$\square$

3. Using the tree below, give the values of each of the items:

    a. the depth of the tree

    5

    b. the ancestors of x18

    x15, x10, x4, x1

    c. the internal nodes of the tree

    x2, x3, x4, x5, x7, x10, x13, x15

    d. the length of the path from x3 to x14

    2

    e. the vertex that is the parent of x16

    x10

    f. the vertices children of x7

    x13, x14
