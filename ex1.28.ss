#lang scheme


(define (expmode base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmode base (/ exp 2) m))
                                m))
        (else
         (remainder (* base (expmode base (- exp 1) m))
                    m))))

(define (miller-rabin-test expmode n)
  (define (try-it a)
    (= (expmode a n n) a))
  (try-it (+ 1 (random (- n 1)))))