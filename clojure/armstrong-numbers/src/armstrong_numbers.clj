(ns armstrong-numbers
  (:require [clojure.math :refer [pow]]))

(defn armstrong? [num]
  (let [digits (seq (str num)) length (count digits)]
    (== num (transduce (map #(pow (Character/digit % 10) length)) + digits))))
