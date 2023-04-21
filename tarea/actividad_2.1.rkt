#|
Activity 2.1

by Mariel Gomez Gutierrez, A01275607
and Santiago Rodríguez Palomo, A01025232
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

(define (fahrenheit-to-celcius fahrenheit)
    (* (- fahrenheit 32) (/ 5.0 9)))

(define (sign n)
    (if (zero? n)
        0
        (if (< n 0)
            -1
            1
        )
    )
)

(define (roots a b c)
    (/
        (+ 
            (* -1 b) ; -b
            (sqrt (- (expt b 2) (* 4 a c))) ; sqrt(b^2 - 4ac)
        )

        (* 2 a) ; 2a
    )
)

(define (BMI weight height)
    (define BMI-value (/ weight (expt height 2)))

    (if (< BMI-value 20)
        "underweight"

        (if (< BMI-value 25)
            "normal"

            (if (< BMI-value 30)
                "obese1"

                (if (< BMI-value 40)
                    "obese2"
                    "obese3"
                )
            )
        )
    )
)

(define (factorial n)
    (let loop ([n n] [a 1])
        (if (zero? n)
            a
            (loop (sub1 n) (* n a))
        )
    )
)

(define (duplicate lst)
    (let loop ([lst lst] [a '()])  
        (if (empty? lst)
            (reverse a)
            (loop (cdr lst) (cons (car lst) (cons (car lst) a)))
        )
    )
)

(define (pow a b)
    (let loop ([a a] [b b] [acc 1])
        (if (zero? b)
            acc
            (loop a (sub1 b) (* acc a))
        )
    )
)

(define (fib n)
    (if (zero? n)
        0
        (let loop ([i 1] [current 1] [previous 0])
            (if (= i n)
                current
                (loop (add1 i) (+ current previous) current)
            )
        )
    )
)

(define (enlist lst)
    (reverse 
        (trace-let loop ([lst lst] [a '()])
            (if (empty? lst)
                a
                (loop (cdr lst) (cons (list (car lst)) a))
            )
        )
    )

)

(define (positives lst)
    (let loop ([lst lst] [a '()])
        (if (empty? lst)
            (reverse a)
            (loop 
                (cdr lst)
                (if (< 0 (car lst))
                    (cons (car lst) a)
                    a
                )
            )
        )
    )
)

(define (add-list lst)
    (let loop ([lst lst] [a 0])
        (if (empty? lst)
            a
            (loop (cdr lst) (+ a (car lst)))
        )
    )
)

(define (invert-pairs lst)
    (reverse 
        (let loop ([lst lst] [a '()])
            (if (empty? lst)
                a
                (loop (cdr lst)
                    (cons (reverse (car lst)) a)
                )
            )
        )
    )
)

(define (list-of-symbols? lst)
    (let loop ([lst lst] [a #t])
        (if (or (not a) (empty? lst))
            a
            (loop (cdr lst) (not (symbol? (car lst))))
        )
    )
)

(define (swapper a b lst)
    (let loop ([lst lst] [acc '()])
        (cond
            [(empty? lst) (reverse acc)]
            [(= a (car lst)) (loop (cdr lst) (cons b acc))]
            [(= b (car lst)) (loop (cdr lst) (cons a acc))]
            [else (loop (cdr lst) (cons (car lst) acc))]
        )
    )
)

(define (dot-product lst1 lst2)
    (let loop ([lst1 lst1] [lst2 lst2] [acc 0])
        (if (empty? lst1)
            acc
            (loop (cdr lst1) (cdr lst2) (+ acc (* (car lst1) (car lst2))))
        )
    )
)

(define (average lst)
    (let loop ([lst lst] [sum 0] [count 0])
        (if (empty? lst)
            (if (zero? count)
                0
                (/ sum count)
            )

            (loop (cdr lst) (+ sum (car lst)) (add1 count))
        )
    )
)

(define (standard-deviation lst)
    (define avg (average lst))

    (let loop ([lst lst] [sum 0] [count 0])
        (if (empty? lst)
            (if (zero? count)
                0
                (sqrt (/ sum count))
            )
            
            (loop 
                (cdr lst)
                (+ sum (expt (- (car lst) avg) 2))
                (add1 count)
            )
        )
    )
)

(define (replic n lst)
    (define (repeat a n)
        (let loop ([n n] [acc '()])
            (if (zero? n)
                (reverse acc)
                (loop (sub1 n) (cons a acc))
            )
        )
    )

    (let loop([lst lst] [acc '()])
        (if (empty? lst)
            acc
            (loop 
                (cdr lst) 
                (append acc (repeat (car lst) n))
            )
        )
    )
)

(define (expand lst)
    (define (repeat a n)
        (let loop ([n n] [acc '()])
            (if (zero? n)
                (reverse acc)
                (loop (sub1 n) (cons a acc))
            )
        )
    )

    (let loop([lst lst] [i 1] [acc '()])
        (if (empty? lst)
            acc
            (loop 
                (cdr lst) 
                (add1 i)
                (append acc (repeat (car lst) i))
            )
        )
    )
)

(define (binary num)
    (let loop ([num num] [acc '()])
        (if (zero? num)
            acc
            (loop (quotient num 2) (cons (remainder num 2) acc))
        )
    )
)