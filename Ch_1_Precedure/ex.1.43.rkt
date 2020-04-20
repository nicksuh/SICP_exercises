#lang sicp
(define (compose prc1 prc2)
  ( lambda (x) (prc1 (prc2 x))))


(define (repeated proc nComp)
        (define (func recur a)
          (cond ( (= a nComp) recur)
                (else (func (compose recur recur) (+ a 1)))))
  (func proc 1))
(define (square x) (* x x))
((repeated square 2) 5)
                
                   