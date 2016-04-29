#lang scheme
(define (fact-lazy n)
  (if (= 1 n)
  n
  (* n (fact-lazy (- n 1)))))

(fact-lazy 10)

(define (fact-rec n)
  (define (fact-iter counter result)
    (if (= (+ 1 n) counter)
        result
        (fact-iter (+ counter 1)
                   (* result counter))))
  (fact-iter 1 1))

(fact-rec 10)

 
