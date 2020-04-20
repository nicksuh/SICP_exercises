#lang sicp

(define (find-cycle listx)
  (let ((pointerlist '()))
    (define (iter-cycle x)
      (if (null? x)
          #f
          (if (memq x pointerlist)
              #t
              (begin (set! pointerlist (cons x pointerlist))
                     (iter-cycle (cdr x))))))
    (iter-cycle listx)))

(define (make-cycle x)
  (set-cdr! (cdr x) x)
  x)
(define hi (make-cycle '(a b)))
(find-cycle hi)


;solution considering 
(define (has-loop? lis) 
  (define (iter searchlist seen) 
    (cond ((not (pair? searchlist)) #f) 
          ((memq searchlist seen) #t) 
          (else (or (iter (car searchlist) (cons searchlist seen)) 
                    (iter (cdr searchlist) (cons searchlist seen)))))) 
  (iter lis '()))
