(ns user-api.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.json :as json]
            [user-api.user-service :refer :all]
            ))

(defn user-routes [user-id]
  (routes
   (GET "/" [] "I will get an user")
   (POST "/" [] "TODO-new")
   (DELETE "/" [] "TODO-delete")
   ))

(def user-service-channels (create-user-service))

(defroutes api-routes
  (context "/user/:user-id" [user-id]
           (user-routes user-id))
  (context "/auth" []
           (routes
            (POST"/" [] "Hello World"))
           )
  )

(def app
  (-> api-routes
      (json/wrap-json-params)
      (json/wrap-json-response)))
