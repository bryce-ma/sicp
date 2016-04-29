#lang scheme

(define square
  (lambda (x) (* x x)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 11)

;; excise 1.22
(define (runtime) (current-milliseconds))
(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (display "")))

(define (report-prime time-using)
  (display " *** ")
  (display time-using))

(define (prime-test-near n)
  (if (prime? n)
      n
      (prime-test-near (+ n 1))))


(time-prime-test (prime-test-near 100000000))

(time-prime-test (prime-test-near 1000000000))
(time-prime-test (prime-test-near 10000000000))
(time-prime-test (prime-test-near 100000000000))
(time-prime-test (prime-test-near 1000000000000))
(time-prime-test (prime-test-near 10000000000000))
(time-prime-test (prime-test-near 100000000000000))
(time-prime-test (prime-test-near 1000000000000000))