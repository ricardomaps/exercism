(ns difference-of-squares)

(defn sum-of-squares [number] 
  (->>
    (range (inc number))
    (map #(* % %))
    (reduce +)))

(defn square-of-sum [number] 
  (->>
    (range (inc number))
    (reduce +)
    (#(* % %))))

(defn difference [number] 
  (- (square-of-sum number) (sum-of-squares number)))