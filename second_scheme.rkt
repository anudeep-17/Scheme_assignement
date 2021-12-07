#lang scheme

#|
SCHEME ASSIGNMENT PART 2 (a)

This is function takes in a list and a atom. And gives out the list without the given atom.
I have used recurssion technique in here also.


****used functions explanition:

1. car : a function that takes one argument, used to access data and return accordingly first element from the list
2. cdr : a function that takes one argument, used to access data and return rest of the list apart from "car" of list
3. cons: function that takes two arguments and returns list with the second value joined to first value.
         in here this return list as it is used to build pairs on and on.
4. display: it is a replication println from java, it shows the entered value, here it is not used in logic but to beautify the test cases.

|#


;----------------------logic begins here--------------------------
#| parameter explain:
1. list1 is the list pased.
2. atom is the element that has to be deleted from list.
|#

(define (deleteatom list1 atom)   ;it takes in parameters as list and atom to pass them and delete the atom.
( cond                            ; cond is used to state conditional statment which passes through if condition returns #t 
    ((null? list1) '())           ; if the list is null, we return an empty list.
    ;now we check for the given list1 first element is a pair or not to check is it a list as list is built on pairs.
    ; if yes : we use cons and join two lists with elements technically without given atom
    ;here we recursively call deleteatom method and cons used to join them and return them.
    ;this comes into action when we have nested lists, that where this plays the role to delete the atom.
    ((pair? (car list1)) (cons (deleteatom (car list1) atom) (deleteatom (cdr list1) atom)))
    ; if it is not a pair: them we check if the given atom and the first element are same.
    ; if yes we recursively call the function again with cdr and not return the first element.
    ((equal? (car list1) atom) (deleteatom (cdr list1) atom))
    ;if it is not equal and not pair then we skip to else
    ;here we join the car of list and call the function again with cdr
    (else (cons (car list1) (deleteatom (cdr list1) atom)))))

; hence basing on the element it will eventually return a list with the atom not existing in it. 

;--------------------- testing for part a begins here -----------------------
; display function is used to indent the output and check the test cases with labels

(display "testing starts here !!!!!")
(display "-------------part a-----------")
(display "\n")

;empty test case
(display "test case 1:     ")
(deleteatom '() '0)

;test case of my name
(display "test case 2:     ")
(deleteatom '(sai vishnu anudeep kadiyala) 'sai)

(display "test case 3:     ")
(deleteatom '(s a i v i s h n u a n u d e e p k a d i y a l a) 's)

(display "test case 4:     ")
(deleteatom '(1 2 123 1234124 (12312 213123 1212 ) 12323  ( 12 (12323))90) '12323 )

(display "test case 5:     ")
(deleteatom '(J a s p e r N e w man) 'man)

(display "test case 6:     ")
(deleteatom '(Jas per Newman) 'per)

(display "test case 7:     ")
(deleteatom '(32 32 32 32 32 32 32 32 32 32 32) '32)

(display "test case 8:     ")
(deleteatom '(-73 -57 -95 -95 -27 -43 -8 -55 -16 -95) '-95)


(display "test case 9:     ")
(deleteatom '((1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4))) '1)

(display "test case 10:     ")
(deleteatom '((1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4))) '4)

;test case with lst being inialized as list and passign it,
(display "test case 11:    ")
(define lst '(1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4)))
(deleteatom lst '2)




; for indentation of output.
(display "\n")
(display "\n")
(display "\n")




#|
SCHEME ASSIGNMENT PART 2 (b)

This is function takes in a list and two atom. And gives out the list with one atom replacing the other in every occurence.
I have used recurssion technique in here also.


****used functions explanition:

1. car : a function that takes one argument, used to access data and return accordingly first element from the list
2. cdr : a function that takes one argument, used to access data and return rest of the list apart from "car" of list
3. cons: function that takes two arguments and returns list with the second value joined to first value.
         in here this return list as it is used to build pairs on and on.
4. display: it is a replication println from java, it shows the entered value, here it is not used in logic but to beautify the test cases.

|#





; ----------------------------logic for part b begins ------------------------
#| parameter explain:
1.find is the element that has to be found
2. replace is the element that find is replaced with
3. list1 is the list pased.
|#
(define (replaceatom find replace list1 )  ; this will pass in 3 parameter a list, what to find and what to replace.
 (cond                                     ; conditional statement is used again.
  ((null? list1) '())                      ;null checker is called here to return null list.
  ;again we check if it is a pair, which is indirectly checking for a list which help in the nested lists so that it check every list.
  ;here we check if the given is nested list hence car being a pair.
  ;if yes: we call the cons and join two items arguments calling the function with car and cdr of list. 
  ((pair? (car list1)) (cons (replaceatom find replace (car list1)) (replaceatom find replace (cdr list1))))
  ; if it is not a pair.
  ;we will check if the first element is same as the find element given.
  ; if yes: we call cons and join replace item as first item and the list that is returned by recursive call of function with rest of the list
  ;this will return list with the replaced item
  ((equal? (car list1) find) (cons replace (replaceatom find replace (cdr list1))))
  (else
   ;if nothing is true we jump to else
   ;here we call cons and return list with cons of first element and recursive function call of rest of the list.
   (cons (car list1) (replaceatom find replace (cdr list1))))))

;hence it will join all the obtained elements basing on comaprision category which will them make returned by cons.


;-------------------------testing begins here for part b --------------------------
; display function is used to indent the output and check the test cases with labels
(display "-------------part b-----------")
(display "\n")
(display "\n")

(display "test case 1:     ")
(replaceatom '0 '1 '())

(display "test case 2:     ")
(replaceatom 'sai 's '(sai vishnu anudeep kadiyala))

(display "test case 3:     ")
(replaceatom 's 'sai '(s a i v i s h n u a n u d e e p k a d i y a l a) )

(display "test case 4:     ")
(replaceatom '12323 '1 '(1 2 123 1234124 (12312 213123 1212 ) 12323  ( 12 (12323))90)  )

(display "test case 5:     ")
(replaceatom 'man 'm '(J a s p e r N e w man) )

(display "test case 6:     ")
(replaceatom 'per 'p '(Jas per Newman) )

(display "test case 7:     ")
(replaceatom '32 '1 '(32 32 32 32 32 32 32 32 32 32 32) )

(display "test case 8:     ")
(replaceatom  '-95 '0 '(-73 -57 -95 -95 -27 -43 -8 -55 -16 -95))

;--------------------nested list test cases -------------------------

(display "test case 9:     ")
(replaceatom '1 '121 '((1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4))) )

(display "test case 10:     ")
(replaceatom '12 '4 '((1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4))))

(display "test case 11:    ")
(replaceatom '1 '3 '(1 2 3 (3 2 (2 4 (2 5 6) 2 5 6) 2 4) 2 3 (2 3 4)))
