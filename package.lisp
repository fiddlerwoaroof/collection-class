;;;; package.lisp

(defpackage #:collection-class
  (:use #:cl #:alexandria #:serapeum)
  (:export collection value-error push-item define-collection random-item nth-item items))

