#lang sicp
;iterative sum

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(define (self n) n)
(define (next x) (+ x 1))
(sum self 1 next 10)