#lang scheme

(provide even? square)

(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))