(ql:quickload :strobolights)
(defpackage strobolights.app
  (:use #:cl)
  (:import-from #:lack.builder
                #:builder)
  (:import-from #:ppcre
                #:scan
                #:regex-replace)
  (:import-from #:strobolights.router
                #:*route*)
  (:import-from #:strobolights.config
                #:config)
  (:import-from #:strobolights
                #:*additional-components*))
(in-package :strobolights.app)

(defmacro build-app ()
  `(builder
    ;; :accesslog ;;いったんウザいので停止。ファイル出力機能ないんだね。
    (if (config :log :error :directory)
        `(:backtrace
          :output ,(config :log :error :directory))
        nil)
    :session
    :validation
    ,@*additional-components*
    *route*))

(build-app)
