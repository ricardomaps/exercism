(ns dnd-character
  (:require [clojure.math :as math]))

(defn score-modifier
  "Calculates the modifier of the given score."
  [score]
  (-> score
      (- 10)
      (/ 2)
      math/floor
      int))

(defn rand-ability
  "Generates a random ability."
  []
  (+ 3 (int (rand 16))))

(defn rand-character
  "Generates a random character."
  []
  (let [character
        {:constitution (rand-ability)
         :strength     (rand-ability)
         :intelligence (rand-ability)
         :charisma     (rand-ability)
         :dexterity    (rand-ability)
         :wisdom       (rand-ability)}]

    (assoc character :hitpoints (+ 10 (score-modifier (:constitution character))))))
