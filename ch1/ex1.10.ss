#lang scheme
(define (ackermann x y)
  (cond ((= 0 y) 0)
        ((= 0 x) (* 2 y))
        ((= 1 y) 2)
        (else (ackermann (- x 1) (ackermann x (- y 1))))))

;linear
(define (f n) (ackermann 0 n))

; exponential
(define (g n)(ackermann 1 n))

; 计算理论教材中有
(define (h n) (ackermann 2 n))

; very hard to compute; maybe not computable
(define (hh n) (ackermann 3 n))

(f 3)
(g 3)
(h 4)
;(hh 4)