#lang scheme

(require "1.2.6.ss")

(require "1.2.4.ss")

(define (expmode2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test expmode2 n) (fast-prime? n (- times 1)))
        (else false)))

;;和教材中的方法相比，在参数n很大的情况下，容易导致栈溢出
(fast-prime? 10011111 10000) 