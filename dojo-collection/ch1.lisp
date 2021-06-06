(defvar *myNumber* 42)
(defvar *myName* "Prescott")
(defvar *temp* *myNumber*)
(setf *myNumber* *myName*)
(setf *myName* *temp*)
; (print *myNumber*)
; (print *myName*)

(defun clean (some-list)
  "remove all items from list that are nil"
  (remove-if-not #'(lambda (item)
                     (and (not (eq nil item)))) 
                 some-list))

(defun print-range(start end)
  "print numbers in range from start to end"
  (loop for n from start to end
        collect (print n)))

(defun dont-worry-be-happy()
  "say happy happy joy joy 5 times"
  (loop for n from 1 to 5
        collect "happy happy joy joy..."))

(defun multiples-of-three-but-not-all()
  (clean
    (loop for n from -300 to 0 by 3
          collect (if (or (= n -3) (= n -6))
                    nil
                    n))))

(defun print-integers-while ()
  (clean
    (let ((n 2000))
      (loop while (<= n 5280)
        collect n
        do (setf n (+ n 1))))))

(defun you-say-its-your-birthday(num1 num2)
  (cond ((and (= num1 3)) (= num2 1) "It's your American birthday!")
        ((and (= num1 1)) (= num2 3) "It's your European birthday!")
        (t "just another day in the world...")))

(defun leap-year(year)
  (cond ((and (= 0 (mod year 4)) (not (= 0 (mod year 100)))) t)
        ((= 0 (mod year 400)) t)
        (t nil)))

(defun print-and-count()
  (let ((num 0) (nums (list)))
      (loop for n from 512 to 4096
            collect (if (= 0 (mod n 5))
                      (progn (setf num (+ num 1))
                            (setf nums (append nums (list n)))
                      nil)))
    (list num nums)))

(defun multiples-of-six()
  (let ((num 6))
    (loop while (<= num 60000)
          collect (print num)
          do (setf num (+ num 6)))))

(defun dojo-count(num)
  (cond ((and (= 0 (mod num 5)) (= 0 (mod num 10))) "coding dojo")
        ((= 0 (mod num 5)) "coding")
        (t (write-to-string num))))

(defun counting-the-dojo-way()
  (loop for n from 1 to 100
        collect (dojo-count n)))

(defun what-do-you-know(incoming)
  incoming)

(defun whoa-that-suckers-huge()
  (let ((sum 0))
    (loop for n from -300000 to 300000
          collect (if (not (= 0 (mod n 2)))
                    (setf sum (+ sum n))))
    sum))

(defun countdown-by-fours()
  (let ((num 2016))
    (loop while (> num 0)
          collect num
          do (setf num (- num 4)))))

(defun flexible-countdown(low high mult)
  (clean
    (loop for n downfrom high to low
          collect (if (= 0 (mod n mult)) n nil))))

(defun the-final-countdown(mult start stop exception)
  (clean
    (if (< start stop)
      (loop while (< start stop)
            collect (if (and (not (= 0 (mod start exception))) (= 0 (mod start mult)))
                      start
                      nil)
            do (setf start (+ start 1)))
      (loop while (> start stop)
            collect (if (and (not (= 0 (mod start exception))) (= 0 (mod start mult)))
                      start
                      nil)
            do (setf start (- start 1))))))

(defun countdown(int)
  (loop for n downfrom int to 0 collect n))

(defun print-and-return(print-me return-me)
  (progn (print print-me) return-me))

(defun first-plus-length(arr)
  (+ (first arr) (length arr)))

(defun values-greater-than-second(arr)
  (if (> (length arr) 1)
    (remove-if #'(lambda (el) (<= el (second arr))) arr)
    arr))

(defun this-length-that-val(len val)
  (loop for n from 1 to len
        collect (if (eq len val)
                  'jinx
                  val)))

(defun fit-the-first-value(arr)
  (cond ((> (first arr) (length arr)) 'too-big)
        ((< (first arr) (length arr)) 'too-small)
        (t 'just-right)))

(defun fahrenheit->celsius()
  'PASS)

(defun celsius->fahrenheit()
  'PASS)

