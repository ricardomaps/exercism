(ns grade-school)

(defn grade [school grade] 
  (get school grade []))


(defn add [school name grade] 
  (update school grade (fn [old] (if (nil? old) [name] (conj old name)))))

(defn sorted [school]  
  (into (sorted-map) (for [[k v] school] {k (sort v)})))
