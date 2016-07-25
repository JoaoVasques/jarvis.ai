(defproject user-api "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :min-lein-version "2.0.0"
  :dependencies [[org.clojure/clojure "1.9.0-alpha10"]
                 ;[org.clojure/clojure "1.8.0"]
                 [compojure "1.5.0"]
                 [ring/ring-json "0.4.0"]
                 [ring/ring-defaults "0.1.5"]
                 [environ "1.0.3"]
                 [org.clojure/core.async "0.2.385"]
                 [org.postgresql/postgresql "9.4.1208.jre7"]
                 [korma "0.4.2"]
                 ]
  :plugins [[lein-ring "0.9.7"]]
  :ring {:handler user-api.handler/app}
  :profiles
  {:dev {:dependencies [[javax.servlet/servlet-api "2.5"]
                        [ring/ring-mock "0.3.0"]]}})

