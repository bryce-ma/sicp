#lang scheme

;recursion
(define (multiply a b)
  (if (= b 0)
      0
      (+ (multiply a (- b 1)) a)))

(multiply 5 6)

;迭代
