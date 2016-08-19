(ns user-api.env
  (:require [selmer.parser :as parser]
            [clojure.tools.logging :as log]
            [user-api.dev-middleware :refer [wrap-dev]]))

(def defaults
  {:init
   (fn []
     (parser/cache-off!)
     (log/info "\n-=[user-api started successfully using the development profile]=-"))
   :stop
   (fn []
     (log/info "\n-=[user-api has shut down successfully]=-"))
   :middleware wrap-dev})
