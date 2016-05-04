#lang scheme

;; base 1 for multiply and base 0 for sum
(define (general-combine-op op term a next b base)
  (if (> a b)
      base
      (op (term a)
         (general-combine-op op term (next a) next b 1))))

(define (product term a next b)
  (general-combine-op * term a next b 1))

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