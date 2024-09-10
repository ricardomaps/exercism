(ns trinary
  (:require [clojure.math :refer [pow]]))

(defn to-decimal [num]
  (let [num (reverse num)]
    (loop [sum 0 idx 0 curr (first num) remaining (rest num)]
      (case curr
        \0 (recur sum (inc idx) (first remaining) (rest remaining))
        \1 (recur (+ (pow 3 idx) sum) (inc idx) (first remaining) (rest remaining))
        \2 (recur (+ (* 2 (pow 3 idx)) sum) (inc idx) (first remaining) (rest remaining))
        nil (int sum)
        0))))