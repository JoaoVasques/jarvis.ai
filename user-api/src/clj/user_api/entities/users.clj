(ns user-api.entities.users
 (:require [schema.core :as s]))

(s/defschema User
  {:first_name s/Str
   :last_name s/Str
   :email s/Str
   :pass s/Str})

(s/defschema UserView (dissoc User :pass))

