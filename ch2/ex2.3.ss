#lang scheme
(require "ex2.2.ss")
(define (make-rectangle segment1 segment2)
  (cons segment1 segment2))

(define (segment-length segment)
  (let ([x-diff (- (x-point (start-segment segment)) (x-point (end-segment segment)))]
        [y-diff (- (y-point (start-segment segment)) (y-point (end-segment segment)))])
    (sqrt (+ (* x-diff x-diff) (* y-diff y-diff)))))

(define (first-edge rect)
  (car rect))
(define (second-edge rect)
  (cdr rect))

;;周长
(define (perimeter rect)
  (* 2 (+ (segment-length (first-edge rect))
          (segment-length (second-edge rect)))))

;;面积
(define (area rect)
  (* (segment-length (first-edge rect))
     (segment-length (second-edge rect))))

#| using this example
 _ _
|   |
|   | 3
|_ _|

  2
2*3 rectangle
|#
(define rect0
  (make-rectangle (make-segment (make-point 0 0) (make-point 2 0))
                  (make-segment (make-point 2 0) (make-point 2 3))))

(perimeter rect0)
;; => 10
(area rect0)
;; => 6