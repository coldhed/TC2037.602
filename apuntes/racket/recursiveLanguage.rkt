#|
Programa para definir lenguajes de manera recursiva

|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

(define (language basis rules iter)
    ; gets a rule, applies it to all the words in the basis, and adds it to the accumulator
    (define (apply-rule basis rule acc)
        (remove-duplicates 
            ;;; (map 
            ;;;     (lambda (word)
            ;;;         (format rule word)
            ;;;     )
            ;;;     basis
            ;;; )
            (let loop ([basis basis] [acc acc])
                (if (empty? basis)
                    acc
                    (loop
                        (cdr basis)
                        (cons (format rule (car basis)) acc)
                    )
                )
            )
        )
    )

    ; iterates through the rules, applies them to the basis, returns the accumulator
    (define (iterate-rules basis rules)
        (let loop ([basis basis] [rules rules] [acc basis])
            (if (empty? rules)
                acc
                (loop
                    basis
                    (cdr rules)
                    (apply-rule basis (car rules) acc)
                )
            )
        )
    )

    ; controls how many times the rules are applied to the basis
    ; the basis grows with each iteration
    (let loop ([basis basis] [rules rules] [iter iter])
        (if (zero? iter)
            basis

            (loop
                (iterate-rules basis rules)
                rules
                (sub1 iter)
            )
        )
    )
)

; (format "aa~a" "b")
; "aab"
; (language '("a") '("aa~a" "~aa" "~ab") 1)