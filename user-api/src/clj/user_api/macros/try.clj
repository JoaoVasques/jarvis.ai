(ns user-api.macros.try)

(defmacro Try [body]
  `(try
     ~body
     (catch Exception e# ~nil)))

