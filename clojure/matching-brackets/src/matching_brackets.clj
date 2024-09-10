(ns matching-brackets)

(def matching { \] \[ \) \( \} \{ })

(defn opening? [character]
  (some #{character} (vals matching)))

(defn closing? [character]
  (some #{character} (keys matching)))

(defn valid? [bracks] 
  (loop [l bracks stack []]
    (let [character (first l)]
      (cond
        (empty? l) (empty? stack)
        (opening? character) (recur (rest l) (cons character stack))
        (closing? character) 
        (if (= (first stack) (matching character)) 
          (recur (rest l) (rest stack))
          false)
        :else (recur (rest l) stack)))))
