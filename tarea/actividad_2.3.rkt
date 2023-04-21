#|
Program to solve activity 2.3:
    Print the lyrics to the "El Pollito Pío" song, recursively.

Santiago Rodríguez
A01025232
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

; get the last letter of the first word
; animal is the animal + their sound, for example: Pollito Pio, Vaca Moo
(define (getLastLetter animal)
    (let loop ([animal (string->list animal)] [previousLetter ""])
        ; if the letter we are on is space, we return the previous letter
        (if (equal? (car animal) #\ )
            previousLetter
            (loop (cdr animal) (car animal))
        )
    )
)

; return the string that will be repeated in the lyrics
(define (animal->repeatingLyric animal)
    ; return the correct pronoun and add a new line
    (if (equal? (getLastLetter animal) #\o)
        (format "   Y el ~a\n" animal)
        (format "   Y la ~a\n" animal)
    )
)

; return the string that introduces the animal
(define (animal->startingLyric animal)
    (if (equal? (getLastLetter animal) #\o)
        (format "En la radio había un ~a\n" animal)
        (format "En la radio había una ~a\n" animal)
    )
)

; displays the lyrics
(define (pollito-lyrics)
    ; defines the animals that will be in the song
    (define animalList '(
        "Pollito Pio" 
        "Gallina Coo" 
        "Gallo Corocó" 
        "Pavo Glú Glú Glú" 
        "Paloma Ruu" 
        "Gato Miao" 
        "Perro Guau Guau" 
        "Cabra Mee" 
        "Cordero Bee" 
        "Vaca Moo" 
        "Toro Muu"
        ))

    ; helper function to print a list of current animals, or animals already introduced
    (define (printAnimals animals)
        (let loop ([animals animals])
            (when (not (empty? animals))
                (display (car animals))
                (loop (cdr animals)) 
            )
        )
    )

    (let loop ([currentAnimals '()] [nextAnimals animalList])
        (cond 
            [(not (empty? nextAnimals)) 
                (printAnimals currentAnimals)
                (display (animal->startingLyric (car nextAnimals)))
                (loop (cons (animal->repeatingLyric (car nextAnimals)) currentAnimals) (cdr nextAnimals))
            ]
            [else
                (printAnimals currentAnimals)
                (display "En la radio hay un Tractor\n  Y el Tractor: Bruum\n  Y el Pollito: oh oh!\n")
            ]
        )
    )
)