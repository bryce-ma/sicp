#lang scheme

;; just to modify make-rat
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< (/ n d) 0)
        (cons (- 0 (abs (/ n g))) (abs (/ d g)))
        (cons (abs (/ n g)) (abs (/ d g))))))

(make-rat -4 -6)
;; => (2 . 3)