#lang scheme
( define (list_absval lst)
   

  (cond
  ((null? lst) '()) 
  (else
   (cons (abs(car lst)) (list_absval (cdr lst))))))

(define lst (list -1 -2 -2 -10 -11 -1111 -324314.12312 -123412312312312312312312))
(list_absval lst)

