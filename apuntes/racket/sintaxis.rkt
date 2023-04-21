#| 

Exercise to practice Racket syntax

|#

; indicates the language used to parse this file
#lang racket

; in order to use the functions in the terminal
(provide (all-defined-out))

(display "Hello, World!\n")

; syntax for airthmetic operations
(- (* 3 6) (/ 4 3.0))

; syntax for declaring a variable
(define data 46.7)

; syntax for defining a function
(define (c->f celcius)
    (+ (* celcius (/ 9.0 5)) 32))

(c->f 20)


(define (f->c fahrenheit)
    (* (- fahrenheit 32) (/ 5.0 9)))

(f->c 59)

; proof that the functions are okay
(c->f (f->c 59))


; Exercises
(define (circleArea radius)
    (* pi radius radius))

(define (circunference radius)
    (* 2 pi radius))