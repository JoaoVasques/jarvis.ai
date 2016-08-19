(ns user
  (:require [mount.core :as mount]
            user-api.core))

(defn start []
  (mount/start-without #'user-api.core/repl-server))

(defn stop []
  (mount/stop-except #'user-api.core/repl-server))

(defn restart []
  (stop)
  (start))


