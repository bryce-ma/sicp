#lang scheme

;; using iteration
#|
(define (cont-frac n d k)
  (define (cont-frac-iter result i)
    (if (= 0 i)
        result
        (cont-frac-iter (/ (n i) (+ (d i)  result))
                        (- i 1))))
  (cont-frac-iter 0 k))
|#

;; using recursion
(define (cont-frac n d k)
  (if (= i k)
        (/ )))

(define gold-cut 1.61803398875)

;; return the smallest number k
(define (try-k k)
  (let* ([guess (cont-frac (lambda (i) 1.0)
                           (lambda (i) 1.0)
                           k)]
         [diff (abs (- guess (/ 1 gold-cut)))])
    (if (< diff 0.0001)
        k
        (try-k (+ 1 k)))))

(try-k 1)
;; => 10