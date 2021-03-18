; Scrap Paper
(defparameter *test-list* '(1 (a b c) 2 (d e f) 3))
(car *test-list*) ; => 1
(cdr *test-list*) ; => ((A B C) 2 (D E F) 3)
(cadr *test-list*) ; => (A B C)
(car (cadr *test-list*)) ; => A

(lamda (x) (= 0 (mod x 2)))
