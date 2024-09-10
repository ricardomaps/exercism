(ns isbn-verifier)

(defn- proc-main [main]
  (->>
    (map #(Character/digit % 10) main)
    (map * (range 10 1 -1))
    (reduce +)))

(defn- proc-check [check]
  (if (= \X check) 10 (Character/digit check 10)))

(defn isbn? [isbn] 
  (let [no-dash (remove #{\-} isbn)
       [main check] (split-at 9 no-dash)
       digit-check (first check)]
    (and
      (= 1 (count check))
      (every? #(Character/isDigit %) main)
      (or (= \X digit-check) (Character/isDigit digit-check))
      (zero? (mod (+ (proc-main main) (proc-check digit-check)) 11)))))

