(ns kindergarten-garden)

(def default-students ["alice" "bob" "charlie" "david" "eve" "fred" "ginny" "harriet" "ileana" "joseph" "kincaid" "larry"])

(def letter-to-flower {\V :violets \R :radishes \G :grass \C :clover})

(defn process-students
  [students]
  (->>
   students
   (map #(keyword (clojure.string/lower-case %)))
   (sort)))

(defn process-garden
  [string]
  (->>
   (clojure.string/split string #"\n")
   (map (partial map #(letter-to-flower %)))))

(defn garden
  ([string students]
   (let [students (process-students students)
         string (process-garden string)]
      (->>
        (map (partial partition 2) string)
        (apply map concat)
        (zipmap students))))
  ([string]
   (garden string default-students)))

