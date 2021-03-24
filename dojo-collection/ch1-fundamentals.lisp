(defvar *myNumber* 42)
(defvar *myName* "Prescott")
(defvar *temp* *myNumber*)
(setf *myNumber* *myName*)
(setf *myName* *temp*)
; (print *myNumber*)
; (print *myName*)

(defun print-range(start end)
  (loop for n from start to end
        collect (print n)))

; Don't worry be happy
(defun greeting()
  (print "good morning!"))

(defun be-cheerful()
  (loop for n from 1 to 5
        collect (greeting)))

(defun multiples-of-three-but-not-all()
  (loop for n from -300 to 0 by 3
        collect (if (or (= n -3) (= n -6))
                  (print "")
                  (print n))))

(defun print-integers-while ()
  (let ((jack 2000))
    (loop while (<= jack 5280)
      collect (print jack)
      do (setf jack (+ jack 1)))))

(defun you-say-its-your-birthday(num1 num2)
  (cond ((and (= num1 3)) (= num2 1) "It's your American birthday!")
        ((and (= num1 1)) (= num2 3) "It's your European birthday!")
        (t "just another day in the world...")))

(defun leap-year(year)
  (cond ((and (= 0 (mod year 4)) (not (= 0 (mod year 100)))) t)
        ((= 0 (mod year 400)) t)
        (t nil)))

(defun print-and-count()
  (let ((num 0))
    (loop for n from 512 to 4096
          collect (if (= 0 (mod n 5))
                    (progn (setf num (+ num 1))
                           (print n))
                    (print nil)))
    (print num)))

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
  (print incoming))

(defun whoa-that-suckers-huge()
  (let ((sum 0))
    (loop for n from -300000 to 300000
          collect (if (not (= 0 (mod n 2)))
                    (setf sum (+ sum n))))
    (print sum)))

(defun countdown-by-fours()
  (let ((num 2016))
    (loop while (> num 0)
          collect (print num)
          do (setf num (- num 4)))))

(defun flexible-countdown(low high mult)
  (loop for n downfrom high to low
        collect (if (= 0 (mod n mult))
                  (print n)
                  (print nil))))

(defun the-final-countdown(mult start stop exception)
  (print 'PASS))
