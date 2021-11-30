#lang scheme
( define (list_absval lst)
   (
   
    let loop((lst lst))
     (
      when (pair? lst)
       
       (define x (car lst))
       (display (abs x))
       (display " ")
       (loop (cdr lst))
      )
    )
(newline)
)

(define lst (list -1 -2 -2 -10 -11 -1111 -324314.12312))
(list_absval lst)

