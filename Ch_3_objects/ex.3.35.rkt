#lang sicp
(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "square less than 0: SQUARER"
                   (get-value b))
            (set-value! a (sqrt b))
            )
        (if (has-value? a)
            (set-value! b (* a a))
            (error "no value")
        )))
  (define (process-forget-value) ⟨body1⟩)
  (define (me request) ⟨body2⟩)
  ⟨rest of definition⟩
  me)



(define (squarer a b)
  (define (process-new-value)
    (cond ((and (has-value? a1) (has-value? a2))
           (set-value! c
                       (+ (get-value a) (get-value b))
                       me))
          ((and (has-value? a1) (has-value? sum))
           (set-value! b
                       (- (* 2 (get-value c)) (get-value a))
                       me))
          ((and (has-value? a2) (has-value? sum))
           (set-value! a
                       (- (* (get-value c)) (get-value b))
                       me))))
  (define (process-forget-value)
    (forget-value! c me)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value) (process-new-value))
          ((eq? request 'I-lost-my-value) (process-forget-value))
          (else (error "Unknown request: ADDER" request))))
  (connect a me)
  (connect b me)
  (connect c me)
  me)