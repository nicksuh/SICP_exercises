#lang sicp

(define (sub-map tree func arg)
   (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (sub-map sub-tree func arg)
              (func sub-tree arg)))
        tree))

(define (square-tree x) (sub-map x (lambda (var1 dummyvar) (* var1 var1)) 2))

(square-tree (list 6 (list 2 9) 4 5 ))

