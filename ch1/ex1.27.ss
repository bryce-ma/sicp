#lang scheme

(require "1.2.6.ss")

(define (fermat-test2 n a)
  (= a (expmode a n n)))

;; use the name carmicheal? can be an ambiguity, because all primes also pass the test
(define (carmicheal? n)
  (define (carmicheal?-iter n times)
    (if (= times 1)
        #t
        (and (fermat-test2 n times)
             (carmicheal?-iter n (- times 1)))))
  (carmicheal?-iter n (- n 1)))

(carmicheal? 561)
(carmicheal? 1105)