#lang sicp


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simpsonIntegral f a b n)
  (define dx (/ (- b a) n))
  (define (add-2dx x)
    (+ x (* 2 dx)))
  
  
  (* (/ dx 3)
     (+ a b
     (* 4 (sum f (+ a dx) add-2dx (cond ((= (remainder n 2) 0) (- b dx))
                                   (else (- b (* 2 dx))))))
     (* 2 (sum f (+ a dx dx) add-2dx (cond ((= (remainder n 2) 0) (- b (* 2 dx)))
                                             (else (- b dx))))))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))

(define (average x y) (/ (+ x y) 2))
(define (average-damp f) (lambda (x) (average x (f x))))
; function modulation. 
((average-damp (lambda (x) (* x x))) 10) 