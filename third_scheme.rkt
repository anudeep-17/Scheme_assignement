#lang scheme

#|
SCHEME ASSIGNMENT PART 3

This is function takes in a list and a atom. And gives out the list without the given atom.
I have used recurssion technique in here also.
divide and conquer rule was also applied here as the probelm was divided in functions and used.


****used functions explanition:

1. car : a function that takes one argument, used to access data and return accordingly first element from the list
2. cdr : a function that takes one argument, used to access data and return rest of the list apart from "car" of list
3. cons: function that takes two arguments and returns list with the second value joined to first value.
         in here this return list as it is used to build pairs on and on.
4: cardr": this is the car and cdr together  like the second element of the list
5. display: it is a replication println from java, it shows the entered value, here it is not used in logic but to beautify the test cases.
6. length :  takes list as parameter and return the length of list.
|#




(define (bubbleatom list) ; calls the list sorts the list
  (if
     (null? (cdr list))   ; checks if the list is null and returns list if null
        ; returns the list if as that element dont have a continuation so it must be sorted already.
        list            
        (if (< (car list) (cadr list))   ; check if the first element is greater than the second element 
            (cons (car list) (bubbleatom (cdr list)))   ; joins the list with the recursive call of sorting the list with first elmenet being first
            ; then it goes on the same way but the first element of cons being the first element of cdr list and rest of the list is passed in function recursively.
            (cons (cadr list) (bubbleatom (cons (car list) (cddr list)))))))
;this method sorts once and it has to be called multiple times to sort it eventually.



;so we use the method bubble sort that calls length times to sort the list.
; used to call the list and with the length of the list that helps to know how many times the list runs 

(define (bubblesort length lst1)    
    (cond ((= length 1) (bubbleatom lst1))   ; calls the function if its only length only 1
          (else (bubblesort (- length 1) (bubbleatom lst1))))) ; else calls the list till the length being 1

;this is the function that makes the call easy by just taking list and using it to get length and calling bubblesort function.
;main function that is called that called bubblesort with the lenght function.
(define (bubblesort_list givenlist) 
    (bubblesort (length givenlist) givenlist)) ; calls the bubble sort with lenght of the list and list.



;-------------testing beigns here --------------------
(display "testing starts here !!!!!!")
(display "\n")

; testing with only one element
(display "test case 1 sorted version:     ")
(bubblesort_list '(1))

(display "test case 2 sorted version:     ")
(bubblesort_list '(56 27))

(display "test case 3 sorted version:     ")
(bubblesort_list '(39 50 19))

(display "test case 4 sorted version:     ")
(bubblesort_list '(92 10 41 76))

(display "test case 5 sorted version:     ")
(bubblesort_list '(3 41 44 79 9))

(display "test case 6 sorted version:     ")
(bubblesort_list '(84 60 30 78 6 83))

(display "test case 7 sorted version:     ")
(bubblesort_list '(-51 61 17 -62 -67 -102 -95))

(display "test case 8 sorted version:     ")
(bubblesort_list '(25 58 13 -30 -80 -97 2 10))

; all poitive test case
(display "test case 9 sorted version:     ")
(bubblesort_list '(79 25 81 87 85 51 57 8 78))

; all negative numbers.
(display "test case 10 sorted version:     ")
(bubblesort_list '(-73 -57 -82 -94 -27 -43 -8 -55 -16 -95))

; a complete sorted list
(display "test case 11 sorted version:     ")
(bubblesort_list '(1 5 8 24 26 30 40 55 61 80 90))