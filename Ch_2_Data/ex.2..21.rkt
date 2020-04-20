#lang sicp

(define (square-list list)
  (map (lambda (x) (* x x)) list))

(square-list (list 1 2 3 4))
