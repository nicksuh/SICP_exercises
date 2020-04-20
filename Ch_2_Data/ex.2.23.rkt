#lang sicp
(define (for-each f x)
  (if (null? (cdr x))
      (f (car x) )
      ((lambda (x) (f (car x)) (for-each f (cdr x))) x)
      )
  )

(define (for-each1 proc items) 
  (let ((items-cdr (cdr items))) 
    (proc (car items)) 
    (if (not (null? items-cdr)) 
        (for-each1 proc items-cdr) 
        5)))

(define (for-eachx proc items) 
    (proc (car items)) 
    (if (not (null? (cdr items))) 
        (for-eachx proc (cdr items)) 
        3))




(for-eachx (lambda (x)
             (newline)
             (display x))
            (list 56 34 32))


(for-each1 (lambda (x)
             (newline)
             (display x))
            (list 56 34 32))



-