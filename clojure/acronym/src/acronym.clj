(ns acronym
  (:require [clojure.string :as str]))

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (str/upper-case (apply str (re-seq #"\b\w|(?<![A-Z])[A-Z]" phrase))))
