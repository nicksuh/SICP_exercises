#lang sicp


(define (iseven n)
             (= (remainder n 2) 0))

(define (naivexp b n) 
 (define (exp-iter-naive k a)
   (cond ((= a n) k)
         ((< a n) (exp-iter-naive (* k b) (+ a 1)))))
 (exp-iter-naive b 1))



 
(define (exp b n) (exp-iter 1 b n))
(define (exp-iter a b n) (cond ((= n 1) (* a b))
                               ((iseven n) (exp-iter a (naivexp b 2) (/ n 2)))
                               (else (exp-iter (* a b) b (- n 1)))
                               ))

  
                  
(exp 2 10)