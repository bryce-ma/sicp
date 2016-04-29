#lang scheme
;;矩阵A=[a b; a a+b;]，列向量[x;y]
;;当n是奇数时
;; A不变，更新[x;y]
;;当n是偶数时
;;[x;y]不变，更新A = A * A

;;初始化
;;a,b=0,1
;;x,y=0,1
(define (fib-log n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter x y a b count)
  (cond
   ((= count 0) y)
   ((even? count) (fib-iter
		   x
		   y
		   (+ (* a a) (* b b))
		   (+ (* a b) (* b a) (* b b))
		   (/ count 2)))
   (else (fib-iter
	  (+ (* a x) (* b y))
	  (+ (* b x) (* (+ a b) y))
	  a
	  b
	  (- count 1)))))

(fib-log 0)
(fib-log 1)
(fib-log 2)
(fib-log 3)
(fib-log 4)
(fib-log 5)
(fib-log 6)
(fib-log 7)