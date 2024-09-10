(ns all-your-base
  (:require [clojure.math :refer [pow]]))

(defn find-val [num base]
  (let [[result _] (reduce
                    (fn [[sum idx] n]
                      (if (or (< n 0) (>= n base)) (reduced nil)
                          [(+ (* n (int (pow base idx))) sum) (dec idx)])) [0 (dec (count num))] num)]
    result))

(defn num-in-base [base num]
  (if (= 0 num) '(0)
      (loop [v num p base pp 1 result '()]
        (if (= 0 v) result
            (let [amt (rem v p) new-el (/ amt pp)]
              (recur (- v amt) (* p base) (* pp base) (conj result new-el)))))))

(defn convert [from num to]
  (if (or (<= to 1) (<= from 1)) nil
      (if (empty? num) num
          (when-let [v (find-val num from)]
            (num-in-base to v)))))