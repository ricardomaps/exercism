(ns atbash-cipher
  (:require [clojure.string :refer [lower-case]]))

(defn encode-char [c]
  (if (or (> (int c) 122) (< (int c) 97))
    c
    (char (- 219 (int c)))))

(defn encode [s]
  (->>
   (lower-case s)
   (filter #(or (Character/isDigit %) (Character/isLetter %)))
   (map encode-char)
   (partition-all 5)
   (interpose " ")
   (flatten)
   (apply str)))

