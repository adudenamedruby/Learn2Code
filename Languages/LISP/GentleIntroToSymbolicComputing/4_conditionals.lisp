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

;; 4.6
(defun my-abs-cond (x)
  (cond ((< x 0) (- x))
        ((>= x 0) x)))

;; 4.7
(defun emphasize3 (x)
  (cond (t (cons `VERY x))))

;;4.10
(defun constrain (x max min)
  (cond ((< x min) min)
        ((> x max) max)
        (t x)))

;; 4.11
(defun firstzero (x)
  (cond ((equal (first x) 0) 'first)
        ((equal (first (rest x)) 0) 'second)
        ((equal (car (last x)) 0) 'third)
        (t 'none)))

;; 4.12
(defun cycle (x)
  (cond ((< x 99) (+ x 1))
        ((equal x 99) 1)))

;;4.15
(defun geq (x y)
  (if (>= x y) t))

;; 4.16
(defun e416 (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
        ((and (oddp x) (< x 0)) (* x 2))
        (t (/ x 2))))

;; 417
(defun e417 (x y)
  (cond ((and (or (equal x 'boy) (equal x 'girl)) (equal y 'child)) t)
        ((and (or (equal x 'woman) (equal x 'man)) (equal y 'adult)) t)))

;; 4.18
(defun e418 (x y)
  (cond ((equal x y) 'tie)
        ((or (and (equal x 'rock)
                  (equal y 'scissors))
             (and (equal x 'scissors)
                  (equal y 'paper))
             (and (equal x 'paper)
                  (equal y 'rock)))
         'first-wins)
        (t 'second-wins)))

;; 4.22
(defun boilingp (temp scale)
  (cond ((equal scale 'farenheight) (> temp 212))
        ((equal scale 'celsius) (> temp 100))))

(step (if (oddp 5) 'yes 'no))
