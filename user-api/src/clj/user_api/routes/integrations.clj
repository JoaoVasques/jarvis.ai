(ns user-api.routes.users
  (:require [ring.util.http-response :refer :all]
            [compojure.api.sweet :refer :all]
            [schema.core :as s]
            [user-api.entities.integrations :as integration-entity]
            ))


(defapi integrations-routes
  {:swagger {:ui "/swagger-ui"
             :spec "/swagger.json"
             :data {:info {:version "1.0.0"
                           :title "User Integrations API"
                           :description "User integrations manager"}}}}

  (context "/integration/:user_id" []
      :path-params [user_id :- s/Str]
      (resource
        {:tags ["integrations"]
         :post {:summary "Adds a new integration to an existing user"
                :parameters {:body-params integration-entity/NewIntegration}
                :responses {http-status/created {:schema s/Str
                                                 :description "the new integration id"}}
                :handler (fn [{body :body-params}]
                           (ok "dummy-id")
                           )}
         :get {:summary "gets all integrations from an existing user"
               :responses {http-status/ok {:schema integration-entity/IntegrationView}}
               :handler (fn [_]
                          (ok "todo"))
               }}))
  
  (context "/user/:user_id/:integration_id" []
      :path-params [id :- s/Str, integration_id :- s/Str]
      (resource
        {:tags ["integrations"]
         :get {:summary "gets an integration"
               :responses {http-status/ok {:schema integration-entity/IntegrationView}}
               :handler (fn [_]
                          (ok "todo"))
               }
         :delete {:summary "deletes a integration"
                  :handler (fn [_]
                             (log/info (str "DELETE user - id: " id))
                             (no-content))}})))  
 
