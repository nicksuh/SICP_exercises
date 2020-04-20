#lang sicp

(define (make-point x y) (cons x y))

(define (vec-add x y) (let ( (a (+ (car x) (car y)))
                        (b (+ (cdr x) (cdr y))))
                        (make-point a b)))

(define (vec-sub x y) (let ( (a (- (car x) (car y)))
                        (b (- (cdr x) (cdr y))))
                        (make-point a b)))
(define (vec-scale x a) (let ( (first (* a (car x)))
                               (sec (* a (cdr x))) )
                          (make-point first sec)))




(define (make-segment x y) (cons x y))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (midpoint-segment x) (let ((a (start-segment x))
                                   (b (end-segment x)))
                               (vec-scale (vec-add a b) 0.5)))


(define x (make-segment (make-point 0 0) (make-point 2 2)))

(midpoint-segment x)