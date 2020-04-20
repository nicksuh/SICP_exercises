#lang sicp

(define tolerance 0.0001)



(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess)
  (newline)
  (display "***")
  )



(define (fixed-point-damp f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try (/ (+ guess next) 2)))))
  (try first-guess)
  (newline)
  (display "***")
  )

(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.5)

(fixed-point-damp (lambda (x) (/ (log 1000) (log x))) 1.5)
