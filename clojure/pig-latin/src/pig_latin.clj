(ns pig-latin)

(defn translate [phrase]
  (let [match1 (re-matcher #"^[aeiou]|^xr|^yt" phrase)
        match2 (re-matcher #"^[^aeiou]+y" phrase)
        match3 (re-matcher #"^.qu" phrase)
        match4 (re-matcher #"^[aeiou]+" phrase)]
    (cond
      (re-find match1) (str phrase "ay")
      (re-find match2) (let [l (dec (count (re-groups match2)))] (str (subs phrase l) (subs phrase 0 l) "ay"))
      (re-find match3) (let [l (count (re-groups match3))] (str (subs phrase l) (subs phrase 0 l) "ay"))
      (re-find match4) (let [l (count (re-groups match4))] (str (subs phrase l) (subs phrase 0 l) "ay")))))
