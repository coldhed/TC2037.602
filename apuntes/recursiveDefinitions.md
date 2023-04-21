## Recursive definition of addition

**s(n) = n + 1**

**I. Basis**: if n = 0, then m + n = m
**II. Recursive Step**: m + s(n) = s(m + n)
**III. Closure Step**: m + n = k only if this equality can be obtained from m + 0 = m using finitely many applications of the recursive step


#### Example of 3+2
= s(s(s(0))) + s(s(0)) // 3 + 2
= s(s(s(s(0))) + s(0)) // (3 + 1) + 1
= s(s(s(s(s(0))))+0) // ((3 + 0) + 1) + 1
= s(s(s(s(s(0))))) // ((3 + 1) + 1)
= 5 // (4 + 1) = 5

## Example 2: Set $X = \{3, 6, 12, 24, ...\}$
**I. Basis:** $ 3 \in X $
**II. Recursive Step:** If $n \in X$ then $2n \in X$
**III. Closure Step**: $n \in X$  only if this equality can be obtained from the base case using a finite number of applications of the recursive step. 

## Función sum(X)
**I. Basis:**  sum( { } ) = 0 
**II. Recursive Step:** If $ X = \{ n \} \cup \{ Y\}$ then sum($X$) = $n$ sum($Y$)
**III. Closure Step**: $n \in X$  only if this equality can be obtained from the base case using a finite number of applications of the recursive step. 


# Inductive demonstrations

## Example 1: Proof of less than
**I. Basis:** [0, 1] 0 < 1
**II. Inductive Hypothesis:** Assume that $x < y$ for all elementes [x, y] $\in LT_n$
**III. Inductive Step:** for values [i, j] $\in LT_{n+1}$

[i, j] = [x, s(y)]            i = x < s(y) = j
[i, j] = [s(x), s(y)]        i = s(x) < s(y) = j
$\square$

## Proof of the addition function
**I. Basis:** m + 0 = m
**II. Inductive Hypothesis:** Assume that for any number k, it holds that m + s(k) = s(m + k)
**III. Inductive Step:** Demonstrate that the same works of (k + 1)

m + s(k + 1) = s(m + (k+1))
m + s(s(k)) = s(m + (k+1))
s(m + s(k)) = s(m + (k+1))
s(m + (k+1)) = s(m + (k+1))
$\square$

## Proof of the Gauss Function

Demonstrate: $ \sum_{i=0}^{n}i = \frac{n(n+1)}{2}$

**I. Basis:** If $n = 0$ then $\frac{0(0+1)}{2} = \frac{0}{2} = 0$
**II. Inductive Hypothesis:** If n = k, it holds that $ \sum_{i=0}^{k}i = \frac{k(k+1)}{2}$

**III. Inductive Step:** For $n = (k+1)$

$\sum_{i=0}^{(k+1)}i = \frac{(k+1)((k+1)+1)}{2}$

$\sum_{i=0}^{k}i+(k+1) = \frac{(k+1)((k+1)+1)}{2}$

$\frac{k(k+1)}{2}+(k+1) = \frac{(k+1)((k+1)+1)}{2}$

$\frac{k(k+1)}{2}+\frac{2(k+1)}{2} = \frac{(k+1)((k+1)+1)}{2}$

$\frac{k(k+1) + 2(k+1)}{2} = \frac{(k+1)((k+1)+1)}{2}$

$\frac{(k+1)(k+2)}{2} = \frac{(k+1)((k+1)+1)}{2}$

$\frac{(k+1)((k+1)+1)}{2} = \frac{(k+1)((k+1)+1)}{2}$

$\square$