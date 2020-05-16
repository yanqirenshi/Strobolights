(in-package :cl-user)

(ql:quickload :alexandria)
(ql:quickload :strobolights)


(defun server ()
  (let ((srv_str (uiop:getenv "STROBOLIGHTS_SERVER")))
    (when srv_str
      (alexandria:make-keyword srv_str))))

(defun address ()
  (uiop:getenv "STROBOLIGHTS_ADDRESS"))

(defun port ()
  (uiop:getenv "STROBOLIGHTS_PORT"))

(defun loop-eight ()
  (do ((i 0)) (nil)
    (sleep 1)
    (if (/= 88888888 i)
        (incf i)
        (progn (setf i 1)
               (sb-ext:gc)))))


(defun main (&rest argv)
  (declare (ignorable argv))
  (strobolights:start :server  (server)
                      :address (address)
                      :port    (port))
  (loop-eight))

(main)
