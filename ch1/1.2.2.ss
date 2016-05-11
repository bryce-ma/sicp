#lang scheme
(define (count-change amount)
  (cc amount 7))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((= kinds-of-coins 0) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
           (cc (- amount (first-domination kinds-of-coins))
               kinds-of-coins)))))

(define (first-domination kinds-ofcoins)
  (cond ((= kinds-ofcoins 1) 1)
        ((= kinds-ofcoins 2) 2)
        ((= kinds-ofcoins 3) 5)
        ((= kinds-ofcoins 4) 10)
        ((= kinds-ofcoins 5) 20)
        ((= kinds-ofcoins 6) 50)
        ((= kinds-ofcoins 7) 100)))
;总钱数为2000时，运行10分钟还没停止，内存限制为128M. 总钱数为400时，运行时间大约为2分钟
(count-change 6)

;迭代实现
;一个已经解决过的面试题。面试的时候使用C++写的代码，使用动态规划，先初始一个二维数组，下标由总钱数和可使用的硬币种类决定。
;某一个位置(amount,kinds)的值，由上述的递归思想，即分为两部分，一部分是不使用当前下标硬币种类的组合数，另一部分是至少使用一个当前下标硬币种类的组合数。
;即(amount,kinds) = (amount,kinds-1) + (amount-value_of_kinds,kinds). 如（10,3）=（10,2）+（10-5,3）=（10,2）+（5,3）
;所以换零钱问题从递归到迭代的转换比起斐波那契数列要稍微困难一点，以为换零钱问题在某个状态上所依赖的前置变量更复杂，而不是如斐波那契的一维线性（依赖前两个变量）。
;过程式语言写一个二层for循环搞定，但是怎么在scheme下实现呢？？
;经过之后的学习，再来用迭代过程解决这个问题
