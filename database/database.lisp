;------------------------------------------------------------------------------
; Relational Database from Scratch
; TODO
; - add UPDATE
; - add tables
; - add primary key generation
; - create CLI
;------------------------------------------------------------------------------
(defvar *db* nil)

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd) (push cd *db*))

(defun pretty-print (cd) 
  (format t "~{~a:~10t~a~%~}~%" cd))

(defun dump-db ()
  (dolist (cd *db*)
    (pretty-print cd)))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
    (y-or-n-p "Ripped [y/n]")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

(defun save-db (filename)
  (with-open-file (out filename
                       :direction :output
                       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun select (selector-fn)
  (remove-if-not selector-fn *db*))

(defun where (&key title artist rating (ripped nil ripped-p))
  #'(lambda (cd)
      (and
        (if title     (equal (getf cd :title)   title)  t)
        (if artist    (equal (getf cd :artist)  artist) t)
        (if rating    (equal (getf cd :rating)  rating) t)
        (if ripped-p  (equal (getf cd :ripped)  ripped) t))))

(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  (setf *db*
        (mapcar 
          #'(lambda (row)
              (when (funcall selector-fn row)
                (if title     (setf (getf row :title)   title))
                (if artist    (setf (getf row :artist)  artist))
                (if rating    (setf (getf row :rating)  rating))
                (if ripped-p  (setf (getf row :ripped)  ripped)))
              row) *db*)))

(defun delete-rows (selector-fn)
  (setf *db* (remove-if selector-fn *db*)))

; -----------------------------------------------------------------------------
; Sandbox
; -----------------------------------------------------------------------------
(defun remove-odds ()
  (remove-if-not #'evenp '(1 2 3 4 5 6 7 8 9 10)))

(defun remove-odds2 ()
  (remove-if-not #'(lambda (x) (= 0 (mod x 2))) '(1 2 3 4 5 6 7 8 9 10)))

(defun remove-not-bob ()
  (remove-if-not #'(lambda (x) (string-equal "bob" x)) '("dick" "jane" "bob" "sally")))

(defun remove-bob ()
  (remove-if #'(lambda (x) (string-equal "bob" x)) '("dick" "jane" "bob" "sally")))

(defun foo (&key a b c) (list a b c))

(defun foo-with-defaults (&key a (b 42) (c 30 c-p)) (list a b c c-p))

(defun artist-selector (artist) 
  #'(lambda (cd) (equal (getf cd :artist) artist)))

(defun select-by-artist (artist)
  (remove-if-not
    #'(lambda (cd) (equal (getf cd :artist) artist))
    *db*))

