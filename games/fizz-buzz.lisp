; fizz-buzz :: number -> string
(defun fizz-buzz(num)
  (cond ((and (= 0 (mod num 3)) (= 0 (mod num 5))) "fizz-buzz")
        ((= 0 (mod num 3)) "fizz")
        ((= 0 (mod num 5)) "buzz")
        (t (write-to-string num))))

(defun play-fizz()
  (loop for n from 1 to 100
        collect (fizz-buzz n)))
