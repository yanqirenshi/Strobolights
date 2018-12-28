(in-package :cl-user)
(defpackage strobolights-asd
  (:use :cl :asdf))
(in-package :strobolights-asd)

(defsystem strobolights
  :version "0.1"
  :author "Satoshi Iwasaki (yanqirenshi@gmail.com)"
  :license "MIT"
  :depends-on (:clack
               :lack
               :lack-middleware-session
               :caveman2
               :uiop
               :lack-middleware-validation
               :sephirothic)
  :components ((:module "src"
                :components
                ((:file "config")
                 (:file "route")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (load-op strobolights-test))))
