(in-package :collection-class)

(defclass collection-iterator (for:iterator)
  ())

(defmethod initialize-instance :after ((iterator collection-iterator) &key object)
  (setf (for:object iterator)
        (items object)))

(defmethod for:has-more ((iterator collection-iterator))
  (not (null (for:object iterator))))

(defmethod for:next ((iterator collection-iterator))
  (let ((collection-items (for:object iterator)))
    (prog1 (car collection-items)
      (setf (for:object iterator)
            (cdr collection-items)))))

(defmethod for:make-iterator ((collection collection) &key)
  (make-instance 'collection-iterator :object collection))


