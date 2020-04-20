#lang sicp


(define (make-monitored function)
  (define fun-count 0)

  (define  (mf input)
    (cond ((symbol? input) (cond ((eq? input 'how-many-calls?) fun-count)
                                 ((eq? input 'reset-count) (set! fun-count (+ fun-count 1)))
                                 ))
          (else (begin (set! fun-count (+ fun-count 1)) (function input)))))
  mf)

(define s (make-monitored sqrt))
(s 'how-many-calls?)

(s 3)

(s 'how-many-calls?)


