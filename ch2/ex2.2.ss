#lang scheme

(provide make-segment start-segment end-segment make-point x-point y-point)

(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (midpoint-segment segment)
  (let ([mid-x (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment)))
                  2)]
        [mid-y (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment)))
                  2)])
    (cons mid-x mid-y)))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define a-segment
  (make-segment (make-point 0 0) (make-point 4 6)))
(print-point (midpoint-segment a-segment))
;; => (2,3)