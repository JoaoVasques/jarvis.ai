(ns models.user-api.user
  (:use korma.core))

(declare users integrations)

(defentity users
  (pk :email)
  (table :users)
  (has-many integrations)
  (entity-fields :name :email :password))

(defentity integrations
  (pk :id)
  (table :integrations)
  (belongs-to users {:fk :user_id})
  (entity-fields :name :type :active))

