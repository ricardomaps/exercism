(ns prime-factors)

(defn of [number] 
  (loop [n number curr 2 factors []]
    (cond 
      (= 1 n) factors
      (zero? (mod n curr)) (recur (/ n curr) curr (conj factors curr))
      :else (recur n (+ curr 1) factors))))
