; Chapter 4 - syntax and semantics

; Comments are preceeded by a semicolon and are treated as whitespace

;; s-expressions
;; - basic elements are lists and atoms
;; - lists are determined by parenthesis and can contain any number of
;;   whitespace separated elements
;; - atoms are everything else
;; - the empty list `()` - which is the same as `nil` is both an atom and a list
;; - elements of lists are themselves s-expressions
;; that's all there is to LISP! well...

; The types of common atoms: numbers, strings, and names
;; Numbers
;;; - any sequence of digits (optionally prefaced with + or -), containing a
;;;   decimal point, or a solidus, or ending with an exponent marker
;;; Examples
;;;; 123
;;;; 3/7
;;;; 1.0
;;;; 1.0e0
;;;; 1.0d0 - d is "double" precision
;;;; 1.0e-4 floating point equal to one-ten-thousandth
;;;; +42
;;;; -42
;;;; -1/4
;;;; 246/2

;; the "reserved" characters
;; ;
;; ()
;; "
;; '
;; `
;; ,
;; :
;; \
;; |

; common style is to use kebab case for names
; common style is to surround a global variable name with *
; common style is to surround constants with +
