#|
Programa para hacer selection sort en recursion con racket
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))





(define (biggest-num list)
    (apply max list)
)

(define (selection-sort list)
    (let loop ([unsorted list] [sorted '()])
        (if (empty? unsorted)
            sorted ; quitar el reverse
            (let big-num-loop ([seen '()] [unseen unsorted] [biggest (biggest-num unsorted)])
                (if (= biggest (car unseen))
                    (loop (append (reverse seen) (cdr unseen)) (cons (car unseen) sorted))
                    (big-num-loop (cons (car unseen) seen) (cdr unseen) biggest) ; agregar biggest
                )
            )
        )
    )
)