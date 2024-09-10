(ns collatz-conjecture)

(defn collatz
  "calculate steps to prove collatz conjecture for given number"
  [num]
  (if (<= num 0)
    (throw "nope")
    (loop [steps 0 num num]
      (if (= num 1)
        steps
        (if (= (mod num 2) 0)
          (recur (inc steps) (/ num 2))
          (recur (inc steps) (+ (* num 3) 1)))))))