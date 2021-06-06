(defun binary-search (num number-list &optional 
                                  (start 0) 
                                  (end (- (length number-list) 1)))
  "execute a binary search for a num in a number list"
  (if (> start end) (return-from binary-search ()))
  (let ((middle (+ start (floor (/ (- end start) 2)))))
    (let (( match (nth middle number-list))) 
      (cond ((= match num) T)
            ((> match num) (binary-search num number-list start (- middle 1)))
            ((< match num) (binary-search num number-list (+ middle 1) end))))))

(binary-search 2 '(1 2 3 4 5 6 7 8 9 10))
(binary-search 4 '(1 2 3 4 5 6))
(binary-search 7 '(1 2 3 4 5 6))
(binary-search 1 '(1 2 3 4 5 6))
(binary-search 6 '(1 2 3 4 5 6))

(defun is-palindrome (word)
  (equal (reverse word) word))

(defun has-palindrome (word)
  T)
