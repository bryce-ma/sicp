#lang scheme

(require "math.ss")
;; copied from ex1.31
;; the filter is more like a Predicate<T> in java8 with lambda calculas
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))

;; define prime?
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (if (= 1 n)  ;;one is not prime
      #f
      (= n (smallest-divisor n))))

;; a) calculate the sum of all primes in [a,b]
(define (prime-sum a b)
  (filtered-accumulate prime?
                       +
                       0
                       (lambda (x) x)
                       a
                       add1
                       b))

(prime-sum 1 5)
;; 2+3+5 = 10

;; b)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define mutual-prime?  ;; m<n
  (lambda (n)
    (lambda (m)
      (= 1 (gcd m n)))))

(define (accumulate-mutual-prime n)
  (filtered-accumulate (mutual-prime? n)  ;; a lambda expression(function) of two parameter that apply one parameter is a function of one parameter
                       *
                       1
                       (lambda (x) x)
                       1
                       add1
                       n))

(accumulate-mutual-prime 8)
;; 3*5*7 = 105
