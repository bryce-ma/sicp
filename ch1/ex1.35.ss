#lang scheme

;;copied from the SICP book
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; using fixed point of x/y=y (y^2=x) to define the square root 
(define sqrt
  (lambda (x)
    (fixed-point (lambda (y) (/ (+ y (/ x y)) 2))
                 1.0)))

(sqrt 16)
;; => 4.000000000000051

;; exercise 1.35
(define (gold-cut)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))
(gold-cut)
;; => 1.6180327868852458