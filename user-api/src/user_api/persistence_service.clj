; Persistence
(ns user-api.persistence-service
  (:require [environ.core :refer [env]]
            [models.user-api.user :as e]
            [clojure.core.async
             :as a
             :refer [>! <! >!! <!! go chan buffer close! thread
                     alts! alts!! timeout]])
   (:use korma.core))

(defrecord PersistenceService [in out])

(defn- insert-entity
  "Inserts a given element (mostly it will be a user) into the specified table"
  [element table]
  (cond
    (= table "users") ((insert e/users (values element)))
    (= table "integrations") ((insert e/integrations (values element)))
    :else ("TODO")
    ))

(defn- find-by [field value]
  (first
    (select e/users
      (where {field value})
      (limit 1))))

(defn- find-user-by-id
  "Fetches a user from the users database"
  [user-id]
  (find-by :id user-id))

(defn create-persistence-service
  "Creates a service responsible for interacting with the user's database"
  []
  (let [in  (chan)
        out (chan)
        ]
    (go (let [input (<! in)
              operation (:op input)
              args (:args input)]
          (cond
            (= operation :insert) (>! out (insert-entity args "todo-table"))
            (= operation :find-by-id) (>! out (find-user-by-id args))
            :else (>! out (str "TODO: invalid request message")))
          )
        )
    (PersistenceService. in out)))

