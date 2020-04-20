#lang sicp

(define a (list 1 3 (list 5 7 ) 9))
(car ( cdr ( car ( cdr (cdr a)))))

(define c (list (list 7)))
(car (car c))
