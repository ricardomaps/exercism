(ns crypto-square
  (:require [clojure.string :as string])
  (:require [clojure.math :as math]))

(defn normalize-plaintext [plaintext] 
  (->> plaintext
       (filter #(Character/isLetterOrDigit %))
       (apply str)
       (string/lower-case)))

(defn square-size [s] 
  (int (math/ceil (math/sqrt (count s)))))

(defn plaintext-segments [s]
  (let [normalized (normalize-plaintext s)
        size (square-size normalized)]
    (->> normalized
         (partition-all size)
         (map (partial apply str)))))

(defn- pad [padder segs]
  (let [l (count (first segs))]
    (map #(concat % (repeat (- l (count %)) padder)) segs)))

(defn ciphertext [s]
  (let [segments (plaintext-segments s)]
    (apply str (apply map str (pad nil segments)))))

(defn normalize-ciphertext [s]
  (->> s
       (plaintext-segments)
       (pad \space)
       (apply map vector)
       (map (partial apply str))
       (string/join " ")))
