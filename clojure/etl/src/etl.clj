(ns etl)

(defn transform [source] 
  (into {}
    (for [[points words] source
          word words]
      [(clojure.string/lower-case word) points])))
