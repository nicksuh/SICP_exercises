#lang sicp

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define squares (list 1 4 9 14 34 ))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1 ) list2))))

(define (last-pair x)
  (if (null? (cdr x))
     x
     (last-pair (cdr x))))



(define (reverse x)
  (if (null? x)
      x
      (append (reverse (cdr x)) (cons (car x) nil))))
     
      
(reverse (list 1 2 3 4))