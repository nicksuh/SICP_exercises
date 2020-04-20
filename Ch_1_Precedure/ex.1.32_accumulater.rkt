#lang sicp


(define (sum_iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))




(define (accumulate_reculsive combiner null-value term a next b)
  (if (> a b)
     null-value
      (combiner (term a)
         (accumulate_reculsive combiner null-value term (next a) next b))))

(define (accumulate_iter combiner null-value term a next b)
   (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))


(define (self n) n)
(define (next n) (+ n 1))

(accumulate_reculsive + 0 self 1 next 10)
(accumulate_iter + 0 self 1 next 10) 