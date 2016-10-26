;;;; collection-class.asd

(asdf:defsystem #:collection-class
  :description "Defines a macro for declaring a class that is a collection of another class"
  :author "Edward Langley <el@elangley.org>"
  :license "MIT"
  :depends-on (#:alexandria
               #:for
               #:serapeum
               )
  :serial t
  :components ((:file "package")
               (:file "collections")
               (:file "collections-for")
               #+sbcl
               (:file "collections-sbcl-iterators")
               ))

