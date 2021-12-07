#lang scheme
#|
SCHEME ASSIGNMENT PART 1

This is function takes in a list and gives out absolute value of the list values.
I have used recurssion technique in here.


****used functions explanition:

1. car : a function that takes one argument, used to access data and return accordingly first element from the list
2. cdr : a function that takes one argument, used to access data and return rest of the list apart from "car" of list
3. cons: function that takes two arguments and returns list with the second value joined to first value.
         in here this return list as it is used to build pairs on and on.
4. abs : takes in number and return absolute value of it.
5. display: it is a replication println from java, it shows the entered value, here it is not used in logic but to beautify the test cases.
"car, cdr and cons" are the important functions in the scheme when dealing with list to extract head and tail of the list
|#


;----------------------logic begins here--------------------------

( define (list_absval lst) ;it takes list as paramenter and passes it through 
  (cond                    ; cond is used to state conditional statment which passes through if condition returns #t 
  ((null? lst) '())        ; we check for the list being empty if so we return empty list to it
  (else
   ;this is the important part of logic ! 
   ;where we collect absolute values of head of list using car and recurcively call the rest of the list using cdr.
   (cons (abs(car lst)) (list_absval (cdr lst))))))   ;cons returns list and values returned here have only absolute values



;--------------------- testing begins here -----------------------
; display function is used to indent the output and check the test cases with labels
(display "-----------Testing starts here-------")
(display "\n")
(display "\n")

;test case 1 with empty list 
(display "test case 1 :    ")
(list_absval '())
(display "\n")

;test case with one negative number to check how it works
(display "test case 2 :    ")
(list_absval '(-102))
(display "\n")

(display "test case 3 :    ")
(list_absval '(-39 68))
(display "\n")

(display "test case 4 :    ")
(list_absval '(83 -34 -92))
(display "\n")

;test case with all positive numbers
(display "test case 5 :    ")
(list_absval '(13 28 17 87))
(display "\n")

(display "test case 6 :    ")
(list_absval '(5 -57 -58 -38 79))
(display "\n")

(display "test case 7 :    ")
(list_absval '(-30 63 55 82 -64 15))
(display "\n")

(display "test case 8 :    ")
(list_absval '(-31 -34 99 42 74 -98 22))
(display "\n")

(display "test case 9 :    ")
(list_absval '(39 -51 -38 65 -44 45 -27 23))
(display "\n")

;test case with all negative numbers
(display "test case 10 :    ")
(list_absval '(-8531 -9161 -8966 -9213 -4539 -4765 -6096 -9167 -4680))
(display "\n")

;test case including decimals
(display "test case 11 :    ")
(define lst (list -1 -2 -2 -10 -11 -1111 -324314.12312 -12341.25525 -21321516544 65165651654))
(list_absval lst)