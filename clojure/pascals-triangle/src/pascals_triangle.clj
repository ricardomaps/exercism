(ns pascals-triangle)

(def triangle 
  (iterate 
   (fn [prev-row] 
     (cons 1N (map (partial reduce +) (partition-all 2 1 prev-row))))
   [1N]))
 
(defn row [index] 
  (nth triangle (dec index)))
