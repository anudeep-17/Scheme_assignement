#lang scheme


(define (deleteitem list1 item) 
( cond
    ((null? list1) '())
    ((pair? (car list1)) (cons (deleteitem (car list1)item) (deleteitem (cdr list1) item)))
    ((equal? (car list1) item) (deleteitem (cdr list1) item)) 
    (else (cons (car list1) (deleteitem (cdr list1) item)))
))


(deleteitem '(1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4))  '2)


(define (find-replace a b list)
 (cond
  ((null? list) '())
  ((pair? (car list)) (cons (find-replace a b (car list)) (find-replace a b (cdr list))))
  ((eq? (car list) a) (cons b (find-replace a b (cdr list))))
  (else
   (cons (car list) (find-replace a b (cdr list))))))

(find-replace '2 '1 '(1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4)))

