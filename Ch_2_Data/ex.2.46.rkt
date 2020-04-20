#lang sicp



(define (make-vect x y)
  (cons x y))
(define (xcor-vect x)
  (car x))
(define (ycor-vect x)
  (cdr x))

(define (add-vect x1 x2)
  (let ((xcor (+ (xcor-vect x1) (xcor-vect x2)))
        (ycor (+ (ycor-vect x1) (ycor-vect x2))))
    (make-vect xcor ycor)))
(define (sub-vect x1 x2)
  (add-vect x1 (make-vect (- (xcor-vect x2)) (- (ycor-vect x2)))))

(define (scale-vect s x1 )
  (make-vect (* s (xcor-vect x1)) (* x (ycor-vect x1))))




    