(defun my-length (list)
  (cond ((eq list nil) 0)
    (T(1+ (my-length (cdr list))))
   )
 )
 
(defun my-memq (element list)
	(cond 
		((null list) nil)
		((eq element (car list)) list)
		(T (my-memq element(cdr list)))
	)
)

(defun my-append (L1 L2)
    (cond 
		((null L1) L2)
        (T (cons (car L1) (my-append (cdr L1) L2)))
    )
)

(defun my-attach (O L)
	(cond 
		((null L)(cons O nil)) 
		(T (cons (car L) (my-attach O (cdr L))))
	)
)

(defun my-assoc (A L)
	(cond 
		((null L) nil)
		((atom L) nil)
		((eq (car L) A) L)
		(T (or (my-assoc A (car L)) (my-assoc A (cdr L))))
	)
)

(defun freq (A L)
	(cond
		((atom L)(if (eq A L) 1 0))
		(T (+ (freq A (car L)) (freq A (cdr L))))
	)
)

(defun mapping (L val)
	(cond ((null L) nil)
		((atom (car L))(cond ((< (car L) val) (car (cdr L)))))
		((null (mapping (car L) val)) (mapping (cdr L) val))
		(T (cons (mapping (car L) val) (mapping (cdr L) val)))
	)
)

(defun my-reverse (L)
  (if (null L) nil
    (append (my-reverse (cdr L)) (list (car L)))
	)
)

(defun is-patter-help(pat str)
	(cond ((atom pat) (eq pat (car str)))
		((null (cdr pat)) (eq (car pat) (car str)))
		(T (and (is-patter-help (car pat) str) (is-patter-help (cdr pat) (cdr str))))))

(defun is-pattern? (pat str)
	(cond ((null (car str)) nil)
		((is-patter-help pat str) str)
		
		(T (is-pattern? pat (cdr str)))))
		
		
(defun first-atom (L)
	(cond
		((atom L) L)
		(T(first-atom (car L)))
	)
)

(defun check-list (L)
	(cond ((atom (car L)) (cdr L))
		((null (check-list (car L))) (cdr L))
		(T (cons (check-list (car L)) (cdr L)))))
		
(defun find-all (A L)
	(cond 
		((null L) nil)
		((eq A (first-atom L)) (cons (first-atom (check-list L)) (find-all A (check-list L))))
		(T (find-all A (check-list L)))
	)
)
	
(defun my-last (A L)
   (cond ((null L) nil)
       ((equal A (car L))L)
       (T (my-last A (cdr L)))
   )
)

