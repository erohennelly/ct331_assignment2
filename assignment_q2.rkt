#lang racket
(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;;A
(define (ins_beg el lst)
  (append (list el) lst))
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))

;;B
(define (ins_end el lst)
  (append lst (list el)))
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

;;C
(define (count_top_level lst)
  (length lst))
(count_top_level '(a (b c) d e)) ;;counts how many items in list

;;D
(define (count_instances el lst)
  (cond
    [(null? lst) 0] 
    [(equal? el (car lst)) (+ 1 (count_instances el (cdr lst)))]
    [else (count_instances el(cdr lst)) ]))

(printf "a should occur 4 times:~a~n"(count_instances 'a '(a c b d e a c d c a a )))

;;E
(define (count_instances_tr el lst)
  (coun_instances el lst 0)
  )
(define (coun_instances el lst total)
  (cond
  [(null? lst) total]
  [(equal? el (car lst)) (coun_instances el (cdr lst) (+ 1 total))]
  [else (coun_instances el (cdr lst) total)]))

(printf "a should occur 4 times:~a~n"(count_instances_tr 'a '(a c b d e a c d c a a )))

;;F
(define (count_instances_deep el lst)
  (c_instances_deep el lst 0))

(define (c_instances_deep el lst total)
  (cond
    [(null? lst) total] 
    
    [(list? (car lst))(c_instances_deep el (cdr lst) (coun_instances el (car lst) total))]
    [(equal? el (car lst)) (c_instances_deep el (cdr lst) (+ 1 total))]
    [else (c_instances_deep el(cdr lst) total) ]))

(printf "a still counts to 4, even when a is enclosed inside the brackets:~a~n"(count_instances_deep  'a '(a c b d e a c (d c a a) )))