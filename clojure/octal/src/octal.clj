(ns octal)

(defn to-decimal [octal-string]
  (reduce 
     (fn [result digit]
       (let [digit (Character/digit digit 8)]
         (if (neg? digit)
           (reduced 0)
           (+ (* 8 result) digit)))) 0 octal-string))
