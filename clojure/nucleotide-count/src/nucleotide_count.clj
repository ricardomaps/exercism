(ns nucleotide-count)

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (let [valid-nucl #{\A \T \C \G}]
    (if (not (contains? valid-nucl nucleotide))
      (throw "what are you talking about")
      (transduce
         (map (fn [x]
          (if (= x nucleotide)
            1
            0))) + strand)))
)    

(defn nucleotide-counts [strand]
  (loop [s strand result {\A 0 \T 0 \C 0 \G 0}]
    (let [nucl (first s)]
      (if (nil? nucl)
        result
        (cond (= nucl \A) (recur (rest s) (update result \A inc))
              (= nucl \T) (recur (rest s) (update result \T inc))
              (= nucl \C) (recur (rest s) (update result \C inc))
              (= nucl \G) (recur (rest s) (update result \G inc))
              :else (throw (Exception. "is this alien DNA?")))))))
