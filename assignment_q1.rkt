#lang racket
(cons 1 2)
(cons 1(cons 2(cons 3 empty)))
(cons "hello"(cons 20(cons(cons 1(cons 2(cons 3 empty)))empty)))
(list "hello" 20(list 1 2 3))
(append '("hello") '(20) '((1 2 3)))
