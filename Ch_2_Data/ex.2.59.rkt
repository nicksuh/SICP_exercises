#lang sicp


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (append (cdr list1) (cons (car list1) list2 ))))


(define (del-set x set)
  (define (recursive-set x set1 prev)
    (cond ((null? set1) prev)
    ((equal? x (car set1)) (append prev (cdr set1)))
    (else (recursive-set x (cdr set1) (cons (car set1) prev )))))
  (recursive-set x set '()))

(define (union-set set1 set2)
  (define (recur-del setx1 setx2)
    (if (null? setx1)
        setx2
        (recur-del (cdr setx1) (del-set (car setx1) setx2))))
  (let ( (all-element (append set1 set2)))
    (recur-del (intersection-set set1 set2) all-element )))

(union-set (list 1 3 2 4) (list 1 5 9 2))


