#lang racket
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x )) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))

(sqrt 0.1)


;Alyssa's new if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
  (else else-clause)))

(new-if (> 3 2) 3 2) ;good so far

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))
; is there any problem?
; scheme解释器对一般的函数使用应用序求值，导致new-if（在这里只是一个一般的函数）的三个参数必须先求值，而new-if的第三个参数中亦含有new-if函数，导致无限递归。
; 详情请了解应用序和正则序的区别。

(new-if #t (display "good ") (display "bad "))
(sqrt2 2)
