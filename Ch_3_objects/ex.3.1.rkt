#lang sicp







(define (make-accumulator ammount)
  (lambda (toadd)
    (begin (set! ammount (+ toadd ammount)) ammount)))

(define A (make-accumulator 10))
(A 10)
           




