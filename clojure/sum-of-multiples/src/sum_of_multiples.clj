(ns sum-of-multiples)

(defn multiples
  "Returns list of multiples upt to limit."
  [limit item]
  (for [
        mul (range)
        :let [multiple (* mul item)]
        :while (< multiple limit)
        ]
    multiple))

(defn sum-of-multiples
  "Sums the multiples of a series of numbers up to specified level."
  [items level]
  (->> 
    (mapcat #(multiples level %) items)
    (distinct)
    (reduce +)))

