(ns user-api.entities.integrations
 (:require [schema.core :as s]))

(s/defschema Integration
  {:id s/Str
   :name s/Str
   :system s/Str
   :user_id s/Str
   :active s/Bool
   :token s/Str})

(s/defschema NewIntegration (dissoc Integration :id))
(s/defschema IntegrationView (dissoc Integration :token))

