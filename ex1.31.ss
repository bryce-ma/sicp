#lang scheme

;; also exercise 1.32
;; recursive version
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

;;sum
(define (sum term a next b)
  (accumulate add 0 term a next b))

;;product
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (id x) x)

;;factorial
(define (factorial n)
  (product id 1 add1 n))

(factorial 3)

(define (pi-iter accurate result)
  (let ([denom (add1 (* accurate 2))]
        [num1 (- (add1 (* accurate 2)) 1)]
        [num2 (add1 (add1 (* accurate 2)))])
    (if (< accurate 1)
        (* 1.0 result)
        (pi-iter (- accurate 1)
                 (* result
                    (/ (* num1 num2)
                       (* denom denom)))))))

(define (pi)
  (* 4 (pi-iter 1000 1)))

(pi)