#lang sicp

(define random-init 0)
(define rand (let ((x random-init))
               (lambda ()
                 (set! x (random-update x))
                 x)))

(define (rand2 pred) (let
                         ( (x random-init) )
                       (cond ((eq? pred 'generate) (lambda ()
                                                    (set! x (rand-update x))
                                                    x))
                             ((eq? pred 'reset) (lambda (y)
                                                  (set! x y)))
                             ((eq? pred 'print) (lambda ()
                                                  x)))))

(rand2 'generate)

                                                