#lang sicp



(define (count-frac-recur n d k)
  (define (recursive_frac n d i k)
    (if (> i k)
        0
        (/ (n i) (- (d i) (recursive_frac n d (+ i 1) k)))))
  (recursive_frac n d 1 k))



(define (tempD x) ((lambda (i) (+ -1 (* i 2))) x))
(tempD 1)

(define (tan x) 
                 (count-frac-recur (lambda (i) (if (> i 1) (* x x) x)) tempD 30 ))

(newline)

(tan 1.5)