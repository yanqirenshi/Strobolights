(ql:quickload :strobolights)

(defpackage strobolights.app
  (:use :cl)
  (:import-from #:lack.builder
                #:builder)
  (:import-from #:ppcre
                #:scan
                #:regex-replace)
  (:import-from #:strobolights.router
                #:*route*)
  (:import-from #:strobolights.config
                #:config))
(in-package :strobolights.app)

(builder
 :accesslog
 (if (config :log :error :directory)
     `(:backtrace
       :output ,(config :log :error :directory))
     nil)
 :session
 :validation
 ;; (:mount "/api/v1" *api-v1*)
 *route*)
