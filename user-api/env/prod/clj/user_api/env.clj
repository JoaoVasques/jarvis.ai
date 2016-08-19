(ns user-api.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[user-api started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[user-api has shut down successfully]=-"))
   :middleware identity})
