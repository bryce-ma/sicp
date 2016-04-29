#lang scheme

;;在区间（a,b）上的求和算子
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;;整数区间求和
(define (plus-sum a b)
  (sum
   +
   a
   (lambda (x) (+ x 1))
   b))

(plus-sum 1 4)

;;心得体会：lambda表达式确实好用
(define (pi-sum a b)
  (sum
   (lambda (x) (/ 1.0 (* x (+ x 2))))
   a
   (lambda (x) (+ x 4))
   b))

(* 8 (pi-sum 1 10000))

;;求积分
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (*
   dx
   (sum f
        (+ a (/ dx 2.0))
        add-dx
        b)))

(define (cube x) (* x x x))

;;精确值为0.25
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

;;练习1.29，辛普森规则求积分
(define (simpson-integral f a b n))