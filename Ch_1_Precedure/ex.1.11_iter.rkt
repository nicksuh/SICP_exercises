#lang sicp
(define (fn n) (fn_iter n 4 2 1 3))
(define (fn_iter n a b c counter)
  (cond ((= 1 n) 1)
        ((= 2 n) 2)
        ((= 3 n) 4)
        ((= counter n) a)
        ((< counter n) (fn_iter n (+ a (* 2 b) (* 3 c)) a b (+ counter 1) ))))
(fn 5)