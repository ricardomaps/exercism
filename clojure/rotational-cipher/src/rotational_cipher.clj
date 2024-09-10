(ns rotational-cipher
  (:require [clojure.string :as string]))

(defn rotmap [rot alpha]
  (->> alpha
       (cycle)
       (drop rot)
       (zipmap alpha)))

(defn combine-rotmaps [rot & alphas]
  (apply merge (map (partial rotmap rot) alphas)))

(def alphabet "abcdefghijklmnopqrstuvwxyz")

(defn rotate [s r] 
  (let [mapping 
        (combine-rotmaps r alphabet (string/upper-case alphabet))]
    (apply str (map #(mapping % %) s))))
