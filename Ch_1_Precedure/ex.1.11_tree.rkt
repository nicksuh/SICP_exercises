#lang sicp

(define (fn n) (cond ((< n 3) n)
                     (else (+ (fn (- n 1))
                              (* (fn (- n 2)) 2)
                              (* (fn (- n 3)) 3)))))
(fn 5)