(ns user-api.routes.users
  (:require [ring.util.http-response :refer :all]
            [ring.util.http-status :as http-status]
            [compojure.api.sweet :refer :all]
            [schema.core :as s]
            [user-api.entities.users :as user-entity]
            [user-api.db.core :refer :all]
            [user-api.macros.try :refer :all]
            [clojure.tools.logging :as log]
            ))

(defapi users-routes
  {:swagger {:ui "/swagger-ui"
             :spec "/swagger.json"
             :data {:info {:version "1.0.0"
                           :title "User API"
                           :description "Sample Services"}}}}

  (context "/user/" []
      (resource
        {:tags ["users"]
         :post {:summary "creates a user"
                :parameters {:body-params user-entity/User}
                :responses {http-status/created {:schema s/Str
                                                 :description "the new user id"}}
                :handler (fn [{body :body-params}]
                           (let [user-id (Try(create-user! body))]
                             (if (some? user-id)
                               (ok)
                               (internal-server-error))))}}))
  
  (context "/user/:id" []
      :path-params [id :- s/Str]
      (resource
        {:tags ["users"]
         :get {:summary "gets a user"
               :responses {http-status/ok {:schema user-entity/UserView}}
               :handler (fn [_]
                          (log/info (str "FETCH user - id: " id))
                          (let [user (get-user {:email id})]
                            (if (some? user)
                              (ok user)
                              (not-found))))
               }
         :put {:summary "updates a user"
               :parameters {:body-params user-entity/UserView}
               :responses {http-status/ok {:schema user-entity/UserView}}
               :handler (fn [{body :body-params}]
                          (log/info (str "UDPATE user - id: " id))
                          (let [result (Try(update-user! body))]
                            (if (some? result)
                              (ok)
                              (internal-server-error))))
               }
         :delete {:summary "deletes a user"
                  :handler (fn [_]
                             (log/info (str "DELETE user - id: " id))
                             (no-content))}})))  
 
