(ns binary
  (:require [clojure.math :refer [pow]]))

(defn- valid? [input]
       "Checks if input is a valid string representation of a binary number."
       (every? #(or (= % \1) (= % \0)) input))

(defn- get-pow-2 [idx c]
       "Returns the power of two associated with the given index and character in a binary string."
       (if (= \0 c) 0
         (pow 2 idx)))

(defn to-decimal
  "Returns decimal value of a string representation of a binary number or zero when input is invalid."
  [binary]
  (if-not (valid? binary) 0
    (->>
      (reverse binary)
      (transduce (map-indexed get-pow-2) +)
      (int)))
  )

      