(ns binary-search)

(defn middle [arr] 
  (quot (count arr) 2))

(defn search-for [needle haystack]
  (if (empty? haystack) 
    (throw (Throwable. "not found"))
    (let [mid (middle haystack) el (nth haystack mid)]
      (cond 
        (= needle el) mid
        (> needle el) (+ (inc mid) (search-for needle (drop (inc mid) haystack)))
        :else (search-for needle (take mid haystack))))))