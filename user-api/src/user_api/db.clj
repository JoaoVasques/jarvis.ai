(ns user-api.db
  (:require [environ.core :refer [env]]
  (:use korma.db)))

(defdb db (postgres {:db (env :pg-db)
                       :user (env :pg-user)
                       :password (env :pg-pwd)
                       ;; optional keys
                       :host (env :pg-host)
                       :port (env :pg-port)}))

