#lang sicp



(define (fringe x)
  (define (iter-fringe input return)
    (if (null? (cdr input))
        (append return (list (car input)))
        (if (pair? (car input))
            (append (iter-fringe (car input) (list )) (iter-fringe (cdr input) (list )))
            (iter-fringe (cdr input) (append return (list (car input))))))) 
  (iter-fringe x (list )))



(fringe (list (list 3 4 5 ) (list 2 3) 2 3 4))

         

  