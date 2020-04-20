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
  (if (null? seqs)
      nil
      (cons ( accumulate op init (car seqs))
            ( accumulate-n op init (cdr seqs)))))


(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (adjoin-position new-row k rest-of-quens)
  (append (list (cons new-row k)) rest-of-quens))


(define (inumerate-single proc seq)
  (if (null? seq)
      true
      (cond ((proc (car seq)) (inumerate-single proc (cdr seq)))
         ((not (proc (car seq))) false))))

(define (safe? k positions)
  (define (position-check proc curseq wholeseq)
    (accumulate (lambda (x y) (and x y)) true (map
                                               (lambda (thisseq) (proc thisseq curseq)) (cdr wholeseq))))
  (if (= k  1)
      true
  (and (position-check (lambda (x y) (not (= (car x) (car y)))) (car positions) positions)
       (position-check (lambda (x y) (not (= (cdr x) (cdr y)))) (car positions) positions)
       (position-check (lambda (x y) (not (= (+ (car x) (cdr x)) (+ (car y) (cdr y)) ))) (car positions) positions)
       (position-check (lambda (x y) (not (= (- (car x) (cdr x)) (- (car y) (cdr y)) ))) (car positions) positions)
       ) ))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list nil)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
(queens 4)
(length (queens 8))



