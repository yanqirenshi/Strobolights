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
                #:config))
(in-package :strobolights.app)

(builder
 ;; :accesslog ;;いったんウザいので停止。ファイル出力機能ないんだね。
 (if (config :log :error :directory)
     `(:backtrace
       :output ,(config :log :error :directory))
     nil)
 :session
 :validation
 (:mount "/ter/api/v1"    ter.api.router:*api-v1*)
 (:mount "/nobit@/api/v1" nobit@.api.api-v1:*router*)
 (:mount "/tatta/api/v1"  tatta-api.api-v1:*api-v1*)
 (:mount "/qupool/api/v1" qpool.api.api-v1:*router*)
 (:mount "/gp/api/v1"     gp.api.router:*api.v.1*)
 ;; AWS
 (:mount "/aws/api/v1/beach"  ahan-whun-shugoi-api.beach:*api-beach*)
 (:mount "/aws/api/v1/cosmos" ahan-whun-shugoi-api.cosmos:*api-cosmos*)
 (:mount "/aws/api/v1"        ahan-whun-shugoi-api.api-v1:*api-v1*)
 ;; gp
 (:mount "/gp/api/v1/" gp.api.router:*api.v.1*)
 ;; jira
 (:mount "/jira/api/v1/" api.jira.router:*v1*)
 *route*)
