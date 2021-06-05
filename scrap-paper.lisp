; Scrap Paper
(defparameter *test-list* '(1 (a b c) 2 (d e f) 3))
(car *test-list*) ; => 1
(cdr *test-list*) ; => ((A B C) 2 (D E F) 3)
(cadr *test-list*) ; => (A B C)
(car (cadr *test-list*)) ; => A

;; Functions
(defun string->length (string-value)
  "not a useful function, but cool name syntax"
  (length string-value))

(defun foo% (&key a b c) (list a b c))
(defun foo%% (&key (a 0) (b 0 b-supplied-p) (c (+ a b))) 
  "keyword argument with expression default"
  (list a b c b-supplied-p))

(foo%% :a 1 :c 6)
(foo%% :a 4 :b 5)
(foo%% :a 42)
(foo%% :c 42)

(defun bar% (&key ((:apple a)) ((:box b) 0) ((:charlie c) 0 c-supplied-p))
  (list a b c c-supplied-p))

(foo%%% :apple 10 :box 20 :charlie 30)
; -> (foo%%% :apple 10 :box 20 :charlie 30)

(defun bar%% (&rest rest &key a b c) (list rest a b c))

(bar%% :a 1 :b 2 :c 3) 
; -> ((:A 1 :B 2 :C 3) 1 2 3)

(defun early-return (n)
  (dotimes (i 10)
    (dotimes (j 10)
      (when (> (* i j) n)
        (return-from early-return (list i j))))))

(early-return 80) ; -> (9 9)
(early-return 81) ; -> NIL


