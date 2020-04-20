#lang sicp

(define f (list 1 2 3 4))

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

(last-pair (list 1 2 3 4 ))