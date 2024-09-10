(ns say
  (:require [clojure.string :refer [trim]]))

(def single-digits 
  {\1 "one"
   \2 "two"
   \3 "three"
   \4 "four"
   \5 "five"
   \6 "six"
   \7 "seven"
   \8 "eight"
   \9 "nine"})

(def teens 
  { \0 "ten"
    \1 "eleven"
    \2 "twelve"
    \3 "thirteen"
    \4 "fourteen"
    \5 "fifteen"
    \6 "sixteen"
    \7 "seventeen"
    \8 "eighteen"
    \9 "nineteen"})

(defn conn-with-units [num]
  (when-let [units (get single-digits num)]
    (str "-" units)))

(def dd-map
  {\2 "twenty"
   \3 "thirty"
   \4 "forty"
   \5 "fifty"
   \6 "sixty"
   \7 "seventy"
   \8 "eighty"
   \9 "ninety"})

(defn double-digits [num]
  (let [c (first num) next-c (first (rest num))]
    (cond
      (= \0 c) (get single-digits next-c)
      (= \1 c) (get teens next-c)
      :else (str (get dd-map c) (conn-with-units next-c)))))

(defn triple-digits [num]
  (if-let [hundreds (get single-digits (first num))]
    (if-let [dd (double-digits (rest num))]
      (str hundreds " hundred " (double-digits (rest num)))    
      (str hundreds " hundred"))
    (double-digits (rest num))))

(defn valid? [num]
  (and (>= num 0) (< num 1000000000000)))

(def separators ["" "thousand" "million" "billion" "trillion" "quadrillion"])

(defn number [num]
  (cond
    (not (valid? num)) (throw (IllegalArgumentException. "nope"))
    (= 0 num) "zero"
    :else (let [num (str num)]
            (as-> num n
              (reverse n)
              (partition 3 3 [\0 \0] n)
              (into []
                    (map (comp triple-digits reverse))
                    n)
              (map vector n separators)
              (remove #(nil? (first %)) n)
              (reverse n)
              (flatten n)
              (interpose " " n)
              (apply str n)
              (trim n)))))
