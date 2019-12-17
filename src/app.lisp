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
                #:*additional-components*
                #:*session-key*))
(in-package :strobolights.app)


(defmacro build-app ()
  `(builder
    ;; :accesslog ;;いったんウザいので停止。ファイル出力機能ないんだね。
    (if (config :log :error :directory)
        `(:backtrace
          :output ,(config :log :error :directory))
        nil)
    (:session :state (lack.middleware.session.state.cookie:make-cookie-state :cookie-key *session-key*))
    :validation
    ,@*additional-components*
    *route*))

(build-app)
