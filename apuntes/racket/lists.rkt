#|

Function and pairs in racket

|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

; pair
; the ' is to define literally, 3 is not a function
; '(3 . 6)
; (cons 3 6)

; list
(define lst '(1 2 3 4 5 6 7 8))

; recursive function for the length of a list
(define (len lst)
    (if (empty? lst)
        0
        (+ 1 (len (cdr lst)))
    )
)

; length using tail recursion
(define (tail-len lst)
    (let loop ([lst lst] [a 0])
        (if (empty? lst)
            a
            (loop (cdr lst) (add1 a))
        )
    )
)

; add elements in a list
(define (tail-sum lst)
    (let loop ([lst lst] [a 0])
        (if (empty? lst)
            a
            (loop (cdr lst) (+ a (car lst)))
        ) 
    )
)

; get the square root of every element in a list

; using append
(define (sqrt-list lst)
    (let loop ([lst lst] [a '()])
        (if (empty? lst)
            a
            (loop 
                (cdr lst) 
                (append a 
                    (list (sqrt (car lst)))
                )
            )
        )
    )
)

; using cons
(define (sqrt-list-alt lst)
    (let loop ([lst lst] [a '()])
        (if (empty? lst)
            a
            (loop 
                (cdr lst) 
                (cons 
                    (sqrt (car lst))
                    a
                )
            )
        )
    )
)