#lang sicp



(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))


(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


(define (accumulate op initial sequence )
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons ( accumulate op init (map car seqs))
            ( accumulate-n op init (map cdr seqs)))))

(define (deepReverse x)
  (if (null? x)
      x
      (append (deepReverse(cdr x)) (cons (if (pair? (car x))
                                                 (deepReverse (car x))
                                                 (car x)) nil))))

(define (dot-product v w)
  (accumulate + 0 ( map * v w)))


(define (matrixVec* m v )
  (map (lambda (row) (map * row v)) m))


(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix*matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (map  (lambda (cell col) (dot-product col row)) row cols))  m)))

(matrix*matrix (list (list 1 2) ( list 3 4)) (list (list 1 2) (list 3 4)))

(transpose (list (list 1 2 3 ) ( list 4 5 6) ( list 7 8 9 )))
