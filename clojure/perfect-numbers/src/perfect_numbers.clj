(ns perfect-numbers)

(defn- aliquot-sum [number]
  (->>
    (range 1 number)
    (filter #(zero? (mod number %)))
    (reduce +)))

(defn classify [number] 
  (if (< number 1) (throw (IllegalArgumentException. "Negative numbers not allowed"))
    (let [aliquot-sum (aliquot-sum number)]
      (cond
        (< aliquot-sum number) :deficient
        (> aliquot-sum number) :abundant
        :else :perfect)))
)
