#lang sicp
(define (compose prc1 prc2)
  ( lambda (x) (prc1 (prc2 x))))


(define (repeated proc nComp)
        (define (func recur a)
          (cond ( (= a nComp) recur)
                (else (func (compose recur recur) (+ a 1)))))
  (func proc 1))
                
(define (smooth f dx)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))
(define (n-fold-smooth f dx fold)
  (repeated (smooth f dx) fold))
