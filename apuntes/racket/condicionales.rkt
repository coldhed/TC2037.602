#lang racket

(provide (all-defined-out))

f
; a leap year is leap if it is divisible by 4
; but not by 100 unless it is divisible by 400

(define (leap? year)
    (and (= 0 (remainder year 4)) 
         (or (not (= 0 (remainder year 100)))
             (= 0 (remainder year 400)))))

(define (month-days month year)
    (case month 
        [(1 3 5 7 8 10 12) 31]
        [(2) (if (leap? year) 29 28)]
        [else 30]
    ))

(define (next-day day month year)
    (if (= day (month-days month year))
        (if (= month 12)
            (list 1 1 (add1 year))
            (list 1 (add1 month) year))
    (list (add1 day) month year)))