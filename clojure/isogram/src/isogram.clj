(ns isogram)

(defn isogram?
  "Returns wheter given string is an isogram"
  [sentence]
  (->>
   (clojure.string/lower-case sentence)
   (filter #(Character/isLetter %))
   (apply distinct?)))


