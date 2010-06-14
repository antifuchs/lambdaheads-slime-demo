;;; Start slime (with M-x slime RET), then
;;; C-c C-k this file to start using its examples.

(cl:defpackage #:slime-examples
  (:use :cl))
(cl:in-package #:slime-examples)

(defmacro example (&body body)
  `(eval-when (:execute)
     ,@body))

(declaim (optimize debug))

;;; * Debugger
(defun calling-this-fails (a)
  (/ a 0))

(defun calls-failing-function (a)
  (calling-this-fails (+ a 200)))


;;; evaluate this with C-M-x:
(example
  (print (calls-failing-function 30)))
;;; See the debugger.
;;; In the debugger, you can do a couple of useful things:
;;;   * Hit RET on any of the stack frames.
;;;   * Hit v on the function frames (in green)
;;;   * Try the restarts
;;;   * Or hit R on any of the frames to return a value from that frame.































;;; * Stepper

(defun foo (i)
  (when (= i 30) (break))
  (if (= i 3)
      :done
      (foo (1- i))))

;;; evaluate this with C-M-x
(example
  (foo 30))
;;; In the debugger, try hitting "s"





























;;; * Inspector
;;; Hit C-c I on each of these lines:

;; Lists:
'(1 2 3 4 5)

;; Compound objects:
(cons 1 "foo bar")

;; Symbols:
:something

;; Packages:
(find-package :slime-examples)

;; Generic functions:
#'print-object

;; Class:
(defclass some-class () ())





























;;; * slime-autodoc

(defun some-arglist (x y &key a b c)
  (declare (ignorable x y a b c))
  x)

;;; Now hit space after "some-arglist":
(example
 (some-arglist))




























;;; class instance creation:

(defclass some-class-with-hints (some-class)
     ((a :initarg :a)
      (some-other-slot :initarg :some-other-slot)))

;;; Hit space after "some-class-with-hints"
(example
  (make-instance 'some-class-with-hints))