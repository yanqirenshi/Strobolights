(in-package :cl-user)
(defpackage strobolights
  (:use :cl)
  (:import-from #:strobolights.config
                #:config)
  (:import-from #:clack
                #:clackup)
  (:export #:start
           #:stop
           #:*additional-components*)
  (:export #:*session-key*))
(in-package :strobolights)

(defvar *appfile-path*
  (asdf:system-relative-pathname :strobolights #P"src/app.lisp"))

(defvar *handler* nil)

(defparameter *additional-components* nil)

(defun start (&rest args &key
                           (server (config :http :server :type))
                           (address nil)
                           (port (config :http :server :port))
                           debug &allow-other-keys)
  (declare (ignore debug))
  (unless server (error "(config :http :server :type) is nil"))
  (unless port (error "(config :http :server :port) is nil"))
  (when *handler*
    (restart-case (error "Server is already running.")
      (restart-server ()
        :report "Restart the server"
        (stop))))
  (setf *handler*
        (apply #'clackup *appfile-path* :server server
                                        :address address
                                        :port port
                                        args)))

(defun stop ()
  (prog1
      (clack:stop *handler*)
    (setf *handler* nil)))

(defvar *session-key* "strobolights.session")
