#|
Implementation of a Deterministic Finite Automaton (DFA) 

A function receives the DFA and a string and returns if such
string belongs in the language defined by the DFA

A DFA is defined as a state machine

Santiago Rodríguez
|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

; transition function
; initial state: q0
; accept states: q1
; the language is an even number of a, followed by b, and followed by any combination of a and b
(define (transition-even-a-b state char)
    ; the transition checks the state, then the char, and with that outputs the next state
    (cond 
        [(eq? state 'q0)
            (cond 
                [(eq? char #\a) 'q2]
                [(eq? char #\b) 'q1]
                [else 'inv]
            )
        ]
        [(eq? state 'q1)
            (cond
                [(eq? char #\a) 'q1]
                [(eq? char #\b) 'q1]
                [else 'inv]
            )
        ]
        [(eq? state 'q2)
            (cond
                [(eq? char #\a) 'q3]
                [(eq? char #\b) 'inv]
                [else 'inv]
            )
        ]
        [(eq? state 'q3)
            (cond
                [(eq? char #\a) 'q2]
                [(eq? char #\b) 'q1]
                [else 'inv]
            )
        ]
        [else 'inv]
    )
)

; another transition function to validate (a* (bb)+)*
(define (delta-even-b state char)
    (case state
        ['q0 
            (cond
                [(eq? char #\a) 'q3]
                [(eq? char #\b) 'q1]
                [else 'inv]
            )
        ]
        ['q1 
            (cond
                [(eq? char #\a) 'inv]
                [(eq? char #\b) 'q2]
                [else 'inv]
            )
        ]
        ['q2
            (cond
                [(eq? char #\a) 'q3]
                [(eq? char #\b) 'q1]
                [else 'inv]
            )
        ]
        ['q3 
            (cond
                [(eq? char #\a) 'q3]
                [(eq? char #\b) 'q1]
                [else 'inv]
            )
        ]
        [else 'inv]
    )
)

(define (delta-numeric state char)
    (case state
        ['start
            (cond 
                [(eq? char #\+) 'sign]
                [(eq? char #\-) 'sign]
                [(char-numeric? char) 'int]
                [else 'inv]
            )
        ]
        ['sign
            (cond
                [(char-numeric? char) 'int]
                [else 'inv]
            )
        ]
        ['int
            (cond 
                [(eq? char #\.) 'dot]
                [(eq? char #\e) 'e]
                [(eq? char #\E) 'e]
                [(char-numeric? char) 'int]
                [else 'inv]
            )
        ]
        ['dot
            (cond 
                [(char-numeric? char) 'float]
                [else 'inv]
            )
        ]
        ['float
            (cond 
                [(eq? char #\e) 'e]
                [(eq? char #\E) 'e]
                [(char-numeric? char) 'float]
                [else 'inv]
            )
        ]
        ['e
            (cond 
                [(eq? char #\+) 'e_sign]
                [(eq? char #\-) 'e_sign]
                [(char-numeric? char) 'exp]
                [else 'inv]
            )
        ]
        ['e_sign
            (cond
                [(char-numeric? char) 'exp]
                [else 'inv]
            )
        ]
        ['exp
            (cond 
                [(char-numeric? char) 'exp]
                [else 'inv]
            )
        ]
        [else 'inv]
    )
)

; the automata could be the list '(transition-even-a-b 'q0 '(q1))
; list of the transition function, the initial state, and a list of accepted states

(struct dfa (func initial accept))
(define automata1 (dfa transition-even-a-b 'q0 '(q1)))
(define automata2 (dfa delta-even-b 'q0 '(q0 q2)))
(define automata3 (dfa delta-numeric 'start '(int float exp)))

; to get the initial element: (dfa-initial automata)
; to get the accept element:  (dfa-accept automata)

(define (evaluate-dfa a-dfa string)
    (let loop ([chars (string->list string)] [state (dfa-initial a-dfa)])
        (cond
            ; if the chars are empty return if the state is valid
            [(empty? chars) 
                (member state (dfa-accept a-dfa))
            ]
            ; the next state is defined by the transition function
            [else
                (loop (cdr chars) ((dfa-func a-dfa) state (car chars)))
            ]
        )
    )
)

; (evaluate-dfa (dfa transition-even-a-b 'q0 '(q1)) "aaaabb")
; (evaluate-dfa (dfa transition-even-a-b 'q0 '(q1)) "aaaaabb")