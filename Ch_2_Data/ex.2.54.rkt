#lang sicp






(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))





(define (equal? x y)
  (cond ((null? x) true)
        ((eq? (car x) (car y)) (equal? (cdr x) (cdr y)))
        (else false)))

(equal? '(this is a list) '(this is a list ))

(equal? '(this is a list) '(this (is a) list ))