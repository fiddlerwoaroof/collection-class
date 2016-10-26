(defpackage #:collection-class.example
  (:use #:cl #:collection-class #:alexandria #:serapeum))

(in-package :collection-class.example)

; Define the class to be contained in the collection
(defclass foo ()
  ((%slot1 :initarg :slot1 :accessor slot1)
   (%slot2 :initarg :slot2 :reader slot2)))

; Define the collection: it's basically a class form, with the name being a list
; of (collection-name collected-class)
(define-collection (collected-foos foo) ()
  ((%collection-slot :initarg :collection-slot :reader collection-slot)))


; Define a collection
(defparameter *collection* (make-instance 'collected-foos :collection-slot "howdy?"))

(push-item (make-instance 'foo :slot1 1 :slot2 2) *collection*)
(push-item (make-instance 'foo :slot1 2 :slot2 2) *collection*)
(push-item (make-instance 'foo :slot1 2 :slot2 3) *collection*)

; On sbcl, we implement the iterator protocol, so we can
; use the builtin sequence functions on the collection.
#+sbcl
(progn
  (collection-slot *collection*)   #| --> "howdy?" |#
  (map 'list #'slot1 *collection*) #| --> (1 2 2)  |#
  (map 'list #'slot2 *collection*) #| --> (2 2 3)  |# 
  )
