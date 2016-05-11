#lang scheme

;; copied from ex1.31
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b))
          (filtered-accumulate combiner null-value term (next a) next b))))

;; todo: get prime? from section 1.2.6
(require "1.2.6.ss")

;; a) calculate the sum of all primes in [a,b]
(define (prime-sum a b)
  (filtered-accumulate prime?
                       +
                       0
                       (lambda (x) x)
                       a
                       add1
                       b))

(prime-sum 1 7)
