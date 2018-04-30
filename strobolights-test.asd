(in-package :cl-user)
(defpackage strobolights-test-asd
  (:use :cl :asdf))
(in-package :strobolights-test-asd)

(defsystem strobolights-test
  :author "Satoshi Iwasaki (yanqirenshi@gmail.com)"
  :license "MIT"
  :depends-on (:strobolights
               :prove)
  :components ((:module "t"
                :components
                ((:file "strobolights"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
