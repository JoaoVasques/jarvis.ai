; User Service
(ns user-api.user-service
  (:require [clojure.core.async
             :as a
             :refer [>! <! >!! <!! go chan buffer close! thread
                     alts! alts!! timeout]]
            [user-api.persistence-service :refer :all]
            ))

(defrecord UserService [in out])

(defn- create
  "TODO"
  [user]
  (println "create user todo"))

(defn- fetch
  ""
  [user-id]
  "fetch-function todo")


(defn- delete
  ""
  [user-id]
  "fetch-function todo")

(defn- generate-invalid-message
  ""
  [input]
  (str "Invalid input for user service: " input))

(defn create-user-service
  "Creates a user service."
  [persistence-in-chan persistence-out-chan]
  (let [in  (chan)
        out (chan)
        ]
    (go (let [input (<! in)
              operation (:op input)
              args (:args input)]
          (cond
            (= operation :create) (>! out (create args))
            (= operation :delete) (>! out (delete args))
            (= operation :fetch)  (>! out (fetch args))
            :else (>! out (generate-invalid-message input)))
          )
        )
    (UserService. in out)))
