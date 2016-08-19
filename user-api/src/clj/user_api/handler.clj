(ns user-api.handler
  (:require [compojure.core :refer [routes wrap-routes]]
            [user-api.layout :refer [error-page]]
            [user-api.routes.users :refer :all]
            [compojure.route :as route]
            [user-api.env :refer [defaults]]
            [mount.core :as mount]
            [user-api.middleware :as middleware]))

(mount/defstate init-app
                :start ((or (:init defaults) identity))
                :stop  ((or (:stop defaults) identity)))

(def app-routes
  (routes
    (-> #'users-routes
        (wrap-routes middleware/wrap-csrf)
        ;; (wrap-routes middleware/wrap-formats)
        )
    (route/not-found
      (:body
        (error-page {:status 404
                     :title "page not found"})))))


(defn app [] (middleware/wrap-base #'app-routes))

