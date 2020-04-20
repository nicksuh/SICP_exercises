#lang sicp

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))


(define dx 0.0001)

(define (cube x) (* x x x))
((deriv cube) 5)

(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))



(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method
   (lambda (y) (- (* y y) x)) 1.0))
(define (cubic a b c)
  (lambda (x) ( +
                (* x x x)
                (* a x x)
                (* b x)
                c)))
(newtons-method (cubic -4 6 -24) 1)