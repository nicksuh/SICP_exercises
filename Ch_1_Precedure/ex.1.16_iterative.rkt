#lang sicp
(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))

;exponential
(define (maxfact n a) (cond
             ((= (remainder n a) 0) a)
             ((= n a) a)
             ((not (= (remainder n a) 0)) (maxfact n (+ a 1)))
             ))

(define (naivexp b n) 
 (define (exp-iter-naive k a)
   (cond ((= a n) k)
         ((< a n) (exp-iter-naive (* k b) (+ a 1)))))
 (exp-iter-naive b 1))



 
(define (exp b n) (exp-iter b n 2))
(define (exp-iter b n factor) (cond ((= n 1)  b)
                               ((= n 2) (* b b))
                               ((= (maxfact n factor) n) (naivexp b n))
                               ((> (maxfact n factor) factor) (exp-iter b n (+ 1 factor))) 
                               ((= (maxfact n factor) factor) (exp-iter (naivexp b factor) (/ n factor) factor))))

(exp 2 12)
