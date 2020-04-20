#lang sicp



(define (count-frac-recur n d k)
  (define (recursive_frac n d i k)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (recursive_frac n d (+ i 1) k)))))
  (recursive_frac n d 1 k))




(define (count-frac-iter n d k)
  (define (iterative_frac n d i k temp)
    (if (< i 1)
        temp
        (iterative_frac n d (- i 1) k (/ (n i) (+ (d i) temp) ) )))
  (iterative_frac n d k k 0))




(count-frac-recur (lambda (i) 1.0) (lambda (i) 1.0) 12)
(newline)
(count-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 12)