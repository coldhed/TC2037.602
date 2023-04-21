#|
Programa para empezar a hacer recursion

|#

#lang racket

(require racket/trace)

(provide (all-defined-out))


; factorial for a positive number
(define (! n)
    (if (zero? n)
        1
        (* n (! (sub1 n)))
    )
)

; sum the digits of a number
(define (sum-digits n)
    (if (< n 10)
        n
        (+ (sum-digits (quotient n 10)) (remainder n 10))
    )
)

; show the recursion stack
(trace sum-digits)
(trace !)


; TAIL RECURSION

; when there are no operations pending,
; the recursive call can replace the stack
; this way at any time there is only one call in the stack

(define (tail-! n)
    ; define an internal function
    (define (do-tail-! n a)
        (if (zero? n)
            a
            (do-tail-! (sub1 n) (* n a))
        )
    )
    ; to see the stack
    (trace do-tail-!)

    ; the accumulator is inited with the value for the base case
    (do-tail-! n 1)
)

(define (tail-sum-digits n)
    ; the internal function is often called loop
    (define (loop n a)
        (if (< n 10)
            (+ n a)
            (loop (quotient n 10) (+ a (remainder n 10))) 
        )
    )
    ; to see the stack
    (trace loop)

    ; the accumulator is set with the base value
    (loop n 0)
)

; lambda functions and let
; let creates a lambda function and runs it
(define (tail-!-2 n)
    (let loop ([n n] [a 1])
        (if (zero? n)
            a
            (loop (sub1 n) (* n a))
        )
    )
)

(define (tail-sum-digits-2 n)
    (trace-let loop ([n n] [a 0])
        (if (< n 10)
            (+ n a)
            (loop (quotient n 10) (+ a (remainder n 10))) 
        )
    )
)