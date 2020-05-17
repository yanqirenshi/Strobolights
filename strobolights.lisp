(in-package :cl-user)


;;;;;
;;;;; setting environments
;;;;;
;;; SBCL
(setf sb-impl::*default-external-format* :utf-8)
(setf sb-alien::*default-c-string-external-format* :utf-8)

;;; ASDF
(require "asdf")
(push #P"~/.asdf/" asdf:*central-registry*)

;;; Quicklisp
n#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))


;;;;;
;;;;; load libs
;;;;;
(ql:quickload :alexandria)
(ql:quickload :strobolights)


;;;;;
;;;;; def funcs
;;;;;
(defun server ()
  (let ((srv_str (uiop:getenv "STROBOLIGHTS_SERVER")))
    (if (null srv_str)
        :woo
        (alexandria:make-keyword srv_str))))

(defun address ()
  (or (uiop:getenv "STROBOLIGHTS_ADDRESS")
      "127.0.0.1"))

(defun port ()
  (or (parse-integer (uiop:getenv "STROBOLIGHTS_PORT"))
      55555))

(defun loop-eight ()
  (do ((i 0)) (nil)
    (sleep 1)
    (if (/= 88888888 i)
        (incf i)
        (progn (setf i 1)
               (sb-ext:gc)))))


;;;;;
;;;;; def main
;;;;;
(defun main (&rest argv)
  (declare (ignorable argv))
  (strobolights:start :server  (server)
                      :address (address)
                      :port    (port))
  (loop-eight))


;;;;;
;;;;; start
;;;;;
(main)
