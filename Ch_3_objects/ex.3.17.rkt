#lang sicp




(define (count-pairs x)
  (let ( (counted '() ) )
    (define (counted? x)
      (if (memq x counted)
           0
          (begin (set! counted (cons x counted))
          1)))
    (define (count x)
      (if (not (pair? x))
          0
          (+ (count (car x))
             (count (cdr x))
             (counted? x))))
    (count x)))

(count-pairs '(a b c))

           