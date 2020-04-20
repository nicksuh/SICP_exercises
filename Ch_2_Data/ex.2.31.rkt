#lang sicp

(define (sub-map tree func arg)
   (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (sub-map sub-tree func arg)
              (func sub-tree arg)))
        tree))



