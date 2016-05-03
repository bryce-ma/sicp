#lang scheme


(define (cube x) (* x x x))

(define even?
  (lambda (n)
    (= 0 (remainder n 2))))

;;练习1.29,辛普森规则求积分
(define (simpson-integral f a b n)
  (let ([h (/ (- b a) n)])
    (define (integral-iter times)
      (cond
        [(= times 0) (f a)]
        [(= times n) (+ (f b) (integral-iter (- times 1)))]
        [(even? n) (+ (* 2.0 (f (+ a (* times h)))) (integral-iter (- times 1)))]
        [else (+ (* 4.0 (f (+ a (* times h)))) (integral-iter (- times 1)))]))
  (* (/ h 3) (integral-iter n))))

(simpson-integral cube 0 1 100)
