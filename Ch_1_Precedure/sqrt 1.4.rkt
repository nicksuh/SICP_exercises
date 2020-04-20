#lang sicp



(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough guess x)
  (= (improve guess x) guess))

           
(define (sqrt-iter guess x)
  (if (good-enough guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x) ( sqrt-iter 1.0 x))

(sqrt 0.0001)