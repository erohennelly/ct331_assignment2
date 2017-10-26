#lang racket

(define binary_example_tree '(((() 1 ()) 3 (() 5 ())) 8 ((() 11 ()) 12 (() 18 ()))))
;Eoghan Hennelly
;A
(define (sorted_tree tree)
  (begin (cond [(not (null? (car tree))) (sorted_tree (car tree))])
         (printf "~a~n" (cadr tree))
         (cond [(not (empty? (caddr tree))) (sorted_tree (caddr tree))])))

;sorted tree
(display "Sorted Tree\n") 
(sorted_tree binary_example_tree)

;B
(define (present_num item tree)
  (cond [(empty? tree) #f] 
        [(equal? item (cadr tree)) #t] 
        [(< item (cadr tree)) (present_num item (car tree))] 
        [(> item (cadr tree)) (present_num item (caddr tree))]))
(display "should return #t\n")
(present_num 2 binary_example_tree)
(display "should return #f\n")
(present_num 18 binary_example_tree)

;C
;inserting item 
(define (insert item tree)
  (cond [(null? tree) (list '() item '())] 
        [(equal? item (cadr tree)) tree]   
        [(< item (cadr tree)) (list (insert item(car tree))(cadr tree) (caddr tree))] 
        [(> item (cadr tree)) (list (car tree) (cadr tree) (insert item(caddr tree)))]))

(display "Inserting into empty tree\n")
(insert 9 '())
(display "Inserting into existing tree\n")
(insert 9 binary_example_tree)


;D
(define (list_into_tree list tree)
  (if (empty? list) tree
      (list_into_tree (cdr list) (insert (car list) tree))))


(display "Inserting list\n ")
(list_into_tree '( 2 4 ) binary_example_tree)

;E
(define (sorted_list list)
  (sorted_tree(list_into_tree list '()))) 
(display "Sorting list 2\n")
(sorted_list '(19 25 31 2 53 5 11 45 67 9 22 ))


;F
;highest order done in ascending and decending order
