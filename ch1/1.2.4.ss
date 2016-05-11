#lang scheme

(provide fast-expt)

(define (square x) (* x x))
;递归实现 空间复杂度O(n),时间复杂度O(n)
(define (expt b n)
  (if (= n 0)
       1
       (* b (expt b (- n 1)))))

(expt 2 100) ;结果为


;尾递归实现 空间复杂度O(1),时间复杂度O(n)
(define (expt2 b n)
  (expt-iter b n 1))

(define (expt-iter b n result)  ;最后一个参数存储结果
  (if (= n 0)
      result
      (expt-iter b (- n 1) (* b result))))

(expt2 2 100) ;结果为

;更快的方法.空间复杂度和时间复杂度都为O(log n)
(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((enven? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(define (enven? n)
  (= (remainder n 2) 0))

(fast-expt 2 100)

;excise 1.16 迭代
;按照教材提示，保持a*(b^n)的值不变，a的初始值设为1
(define (fast-expt2-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt2-iter (square b) (/ n 2) a))
        (else (fast-expt2-iter b (- n 1) (* b a)))))

(define (fast-expt2 b n)
  (fast-expt2-iter b n 1))

(fast-expt2 2 100)
