(ns user-api.test.db.core
  (:require [user-api.db.core :refer [*db*] :as db]
            [luminus-migrations.core :as migrations]
            [clojure.test :refer :all]
            [clojure.java.jdbc :as jdbc]
            [user-api.config :refer [env]]
            [mount.core :as mount]))

;; TODO
;; (use-fixtures
;;   :once
;;   (fn [f]
;;     (mount/start
;;       #'user-api.config/env
;;       #'user-api.db.core/*db*)
;;     (migrations/migrate ["migrate"] (select-keys env [:database-url]))
;;     (f)))

;; (deftest test-users
;;   (jdbc/with-db-transaction [t-conn *db*]
;;     (jdbc/db-set-rollback-only! t-conn)
;;     (is (= 1 (db/create-user!
;;                t-conn
;;                {:id         "1"
;;                 :first_name "Sam"
;;                 :last_name  "Smith"
;;                 :email      "sam.smith@example.com"
;;                 :pass       "pass"})))
;;     (is (= {:id         "1"
;;             :first_name "Sam"
;;             :last_name  "Smith"
;;             :email      "sam.smith@example.com"
;;             :pass       "pass"
;;             :admin      nil
;;             :last_login nil
;;             :is_active  nil}
;;            (db/get-user t-conn {:id "1"})))))
