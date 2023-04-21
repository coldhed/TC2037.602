#lang racket

(require racket/trace)


#|
Recreate the functionality of length.
Return the number of elements in a list
|#

(provide sum lst len sum-tail sqrt-list sqrt-list-alt)

(define lst '(1 2 3 4 5 6 7 8 ))


(define (len lst)
  (if (empty? lst)
      0
      (+ 1 (len (cdr lst)))
      )
  )


#|
Reimplement length using tail
|#

(define (len-tail lst)
  (let loop
    ([lst lst]
     [res 0])
    (if (empty? lst)
        res
        (loop (cdr lst) (+ 1 res))
     )
    )
  )


#|
Add all elements in a list
|#

(define (sum lst)
  (if (empty? lst)
      0
      (+ (car lst) (sum (cdr lst)))
      )
  
  )

#|
Add all elements in a list with tail
|#

(define (sum-tail lst)
  (let loop
    ([lst lst]
     [res 0])
    (if (empty? lst)
        res
        (loop (cdr lst) (+ (car lst) res))
     )
    )
  )

#|
Get the squate root of every element in a list with append
|#

(define (sqrt-list lst)
  (let loop
    ([lst lst]
     [res '()])
    (if (empty? lst)
        res
        (loop (cdr lst) (append res (list (sqrt (car lst)))))
        )
    )
  )

#|
Get the squate root of every element in a list with cons
|#

(define (sqrt-list-alt lst)
  (let loop
    ([lst lst]
     [res '()])
    (if (empty? lst)
        res
        (loop (cdr lst) (cons (sqrt (car lst)) res)) 
        )
    )
  )
