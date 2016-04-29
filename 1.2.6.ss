#lang scheme

(provide fermat-test)

(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))
;; 素数检测
(define (expmode base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmode base (/ exp 2) m))
                                m))
        (else
         (remainder (* base (expmode base (- exp 1) m))
                    m))))

(define (fermat-test expmode n)
  (define (try-it a)
    (= (expmode a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test expmode n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 10011111 10000) 