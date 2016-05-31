#lang scheme

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))
(define (car z)
  (let ([num 2])
    (if (= z 1)
        0
        (if (= 0 (remainder z num))
            (+ 1 (car (/ z num)))
            0))))
(define (cdr z)
  (let ([num 3])
    (if (= z 1)
        0
        (if (= 0 (remainder z num))
            (+ 1 (car (/ z num)))
            0))))

(car (cons 2 3))
;; => 2
(cdr (cons 2 3))
;; => 3