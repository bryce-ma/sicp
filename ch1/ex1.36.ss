#lang scheme

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; not use average damping
(define (x^x n)
  (fixed-point (lambda (x) (/ (log n) (log x)))
               2.0))

;; using average damping
(define (x^x-with-damp n)
  (define (average a b)
    (/ (+ a b) 2))
  (fixed-point (lambda (x) (average x (/ (log n) (log x))))
               2.0))

(x^x 1000)

;; less steps
(x^x-with-damp 1000)