#lang sicp


(define (make-account balance password)
  (define passwordtry 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define call-the-cops
    (lambda (x) "polic is comming" ))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    (cond ((eq? pass password) 
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
          (else (cond ((> passwordtry 3) call-the-cops) (else (begin (set! passwordtry (+ passwordtry 1)) (lambda (x) "incorrect password"))))))
    
      )
  dispatch)

(define acc (make-account 100 'nick))

((acc 'ick 'deposit) 100)
((acc 'ick 'deposit) 100)
((acc 'ick 'deposit) 100)
((acc 'ick 'deposit) 100)
((acc 'ick 'deposit) 100)