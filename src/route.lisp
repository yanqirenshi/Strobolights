(in-package :cl-user)
(defpackage strobolights.router
  (:use :cl
        :caveman2
        :lack.middleware.validation
        :strobolights.config)
  (:export #:*route*))
(in-package :strobolights.router)

;;;;;
;;;;; Router
;;;;;
(defclass <router> (<app>) ())
(defvar *route* (make-instance '<router>))
(clear-routing-rules *route*)

;;;;;
;;;;; Routing rules
;;;;;
(defroute "/" ()
  "")

;;;;;
;;;;; Error pages
;;;;;
(defmethod on-exception ((app <router>) (code (eql 404)))
  (declare (ignore app))
  "404")
