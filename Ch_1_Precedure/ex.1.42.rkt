#lang sicp
(define (compose prc1 prc2)
  ( lambda (x) (prc1 (prc2 x))))
((compose (lambda (x) (* x x)) inc) 6)

