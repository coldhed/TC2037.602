#|
Implementation of a Deterministic Finite Automaton (DFA) for arithmetic expressions

Mariel Gómez, A01275607
Santiago Rodríguez, A01025232
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

(define (char-operator? char)
    (or (eq? char #\+) (eq? char #\-) (eq? char #\*) (eq? char #\/) (eq? char #\=) (eq? char #\^))
)

(define (delta-arithmetic state char)
    (case state
        ['start
            (cond 
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
                [(eq? #\( char) (values 'par_open #f)]
                [(char-numeric? char) (values 'int #f)]
                [(or (char-alphabetic? char) (eq? char #\_)) (values 'var #f)]
                [(eq? char #\space) (values 'start #f)]
                [else (values 'inv #f)]
            )
        ]
        ['sign
            (cond
                [(char-numeric? char) (values 'int #f)]
                [else (values 'inv #f)]
            )
        ]
        ['int
            (cond 
                [(eq? char #\.) (values 'dot #f)]
                [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
                [(char-numeric? char) (values 'int #f)]
                [(char-operator? char) (values 'op 'int)]
                [(eq? char #\space) (values 'spa 'int)]
                [(eq? #\) char) (values 'par_close 'int)]
                [else (values 'inv #f)]
            )
        ]
        ['dot
            (cond 
                [(char-numeric? char) (values 'float #f)]
                [else (values 'inv #f)]
            )
        ]
        ['float
            (cond 
                [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
                [(char-numeric? char) (values 'float #f)]
                [(char-operator? char) (values 'op 'float)]
                [(eq? char #\space) (values 'spa 'float)]
                [(eq? #\) char) (values 'par_close 'float)]
                [else (values 'inv #f)]
            )
        ]
        ['e
            (cond 
                [(or (eq? char #\+) (eq? char #\-)) (values 'e_sign #f)]
                [(char-numeric? char) (values 'exp #f)]
                [else (values 'inv #f)]
            )
        ]
        ['e_sign
            (cond
                [(char-numeric? char) (values 'exp #f)]
                [else (values 'inv #f)]
            )
        ]
        ['exp
            (cond 
                [(char-numeric? char) (values 'exp #f)]
                [(char-operator? char) (values 'op 'exp)]
                [(eq? char #\space) (values 'spa 'exp)]
                [(eq? #\) char) (values 'par_close 'exp)]
                [else (values 'inv #f)]
            )
        ]
        ['op
            (cond
                [(or (char-alphabetic? char) (eq? char #\_)) (values 'var 'op)]
                [(eq? char #\space) (values 'o_spa 'op)]
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
                [(char-numeric? char) (values 'int 'op)]
                [(eq? #\( char) (values 'par_open 'op)]
                [else (values 'inv #f)]
            )
        ]
        ['o_spa
            (cond
                [(or (char-alphabetic? char) (eq? char #\_)) (values 'var #f)]
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
                [(char-numeric? char) (values 'int #f)]
                [(eq? char #\space) (values 'o_spa #f)]
                [(eq? #\( char) (values 'par_open #f)]
                [else (values 'inv #f)]
            )
        ]
        ['var
            (cond
                [(or (char-alphabetic? char) (eq? char #\_) (char-numeric? char)) (values 'var #f)]
                [(eq? char #\space) (values 'spa 'var)]
                [(char-operator? char) (values 'op 'var)]
                [(eq? #\) char) (values 'par_close 'var)]
                [else (values 'inv #f)]
            )
        ]
        ['spa
            (cond
                [(char-operator? char) (values 'op #f)]
                [(eq? char #\space) (values 'spa #f)]
                [(eq? #\) char) (values 'par_close #f)]
                [else (values 'inv #f)]
            )
        ]
        ['par_open
            (cond            
                [(char-numeric? char) (values 'int 'par_open)]
                [(or (char-alphabetic? char) (eq? char #\_)) (values 'var 'par_open)]
                [(eq? #\( char) (values 'par_open 'par_open)]
                [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'par_open)]
                [(eq? #\space char) (values 'o_spa 'par_open)]
                [else (values 'inv #f)]
            )
        ]
        ['par_close
            (cond
                [(eq? #\) char) (values 'par_close 'par_close)]
                [(char-operator? char) (values 'op 'par_close)]
                [(eq? #\space char) (values 'spa 'par_close)]
                [else (values 'inv #f)]
            )
        ]
        [else (values 'inv #f)]
    )
)

(struct dfa (func initial accept))
(define arithmetic-dfa (dfa delta-arithmetic 'start '(int float var exp spa par_close)))

(define (evaluate-dfa a-dfa string)
    (let loop ([chars (string->list string)] [state (dfa-initial a-dfa)] [tokens '()] [currentToken '()])
        (cond
            ; if the chars are empty return if the state is valid
            [(empty? chars)
                (if (member state (dfa-accept a-dfa))
                    (if (eq? state 'spa)
                        (reverse tokens)
                        (reverse (cons (list state (list->string (reverse currentToken))) tokens))
                    )
                    'inv
                )
            ]
            ; the next state is defined by the transition function
            [else
                (let-values ([(newState found) ((dfa-func a-dfa) state (car chars))])
                    (if found 
                        (loop (cdr chars) newState
                            (cons (list found (list->string (reverse currentToken))) tokens)
                            (if (eq? #\space (car chars))
                                '()
                                (list (car chars))
                            ) 
                        )
                        (loop (cdr chars) newState tokens
                            (if (eq? #\space (car chars))
                                currentToken
                                (cons (car chars) currentToken)
                            ) 
                        )
                    )
                )
            ]
        )
    )
)

(evaluate-dfa arithmetic-dfa "(4 + 5) * (6 - 3)")