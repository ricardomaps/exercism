(ns bob
  (:require [clojure.string :as str]))

(defn- yelling? [s]
  (let [s (str/replace s #"[^a-zA-Z]" "")]
    (and (not= "" s)(= s (str/upper-case s)))))

(defn- questioning? [s]
  (str/ends-with? (str/trimr s) "?"))

(defn- silence? [s]
  (str/blank? s))

(defn response-for [s]
  (let [yelling (yelling? s)
        questioning (questioning? s)
       ]
    (cond 
      (and yelling questioning) "Calm down, I know what I'm doing!" 
      yelling "Whoa, chill out!"
      questioning "Sure." 
      (silence? s) "Fine. Be that way!"
      :else "Whatever.")))
