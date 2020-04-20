#lang sicp

(define (pst depth fromleft) (cond ((= depth 1) 1)
                                   ((= fromleft 1) 1)
                                   ((= fromleft depth) 1)
                                   ((> depth 2) (+ (pst (- depth 1) fromleft)
                                                   (pst (- depth 1) (- fromleft 1))))))
(pst 5 3)