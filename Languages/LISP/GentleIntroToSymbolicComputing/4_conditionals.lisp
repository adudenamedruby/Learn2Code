;;; Conditionals
;; 4.1
(defun make-even (x)
  (if (evenp x)
      x
      (+ 1 x)))

;; 4.2
(defun further (x)
  (if (>= x 0)
      (+ 1 x)
      (- x 1)))

;; 4.3
(defun my-not (x)
  (if x
      nil
      t))

;; 4.4
(defun ordered (x y)
  (if (< x y)
      (list x y)
      (list y x)))
