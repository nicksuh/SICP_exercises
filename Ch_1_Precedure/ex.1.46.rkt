#lang sicp



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

(define (iterative-improve good? improve)
  (lambda (x) (if (good? x)
                  x
                  ((iterative-improve good? improve) (improve x)))))

                 