#lang scheme
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
  (else else-clause)))

(new-if (> 3 2) 3 2) ;good so far

