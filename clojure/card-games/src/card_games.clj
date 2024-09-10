(ns card-games)

(defn rounds
  "Takes the current round number and returns 
   a `list` with that round and the _next two_."
  [n]
  (list n (+ n 1) (+ n 2))
  )

(defn concat-rounds 
  "Takes two lists and returns a single `list` 
   consisting of all the rounds in the first `list`, 
   followed by all the rounds in the second `list`"
  [l1 l2]
  (concat l1 l2)
  )

(defn contains-round? 
  "Takes a list of rounds played and a round number.
   Returns `true` if the round is in the list, `false` if not."
  [l n]
  (if (some #(== n %) l) true false)
  )

(defn card-average
  "Returns the average value of a hand"
  [hand]
  (let [[numerator denominator] (reduce (fn [[n d] e] [(+ n e) (inc d)]) [0 0] hand)]
    (float(/ numerator denominator))
    )
  )

(defn approx-average?
  "Returns `true` if average is equal to either one of:
  - Take the average of the _first_ and _last_ number in the hand.
  - Using the median (middle card) of the hand."
  [hand]
  (let [
        actual-avg (card-average hand)
        alt-avg (/ (+ (first hand) (last hand)) 2)
        median (nth hand (int (/ (count hand) 2)))
        ]
  (or (== actual-avg alt-avg) (== actual-avg median))
  )
)

(defn average-even-odd?
  "Returns true if the average of the cards at even indexes 
   is the same as the average of the cards at odd indexes."
  [hand]
  (let [[_ even-els odd-els sum-evens sum-odds] (reduce 
            (fn [[index evens odds sum-even sum-odd] el]
              (if (== (rem index 2) 0) 
                [(inc index) (inc evens) odds (+ sum-even el) sum-odd]
                [(inc index) evens (inc odds) sum-even (+ sum-odd el)]
                )
              ) [0 0 0 0 0] hand)]
    (== (/ sum-evens even-els) (/ sum-odds odd-els))
  )
)

(defn maybe-double-last
  "If the last card is a Jack (11), doubles its value
   before returning the hand."
  [hand]
  (if (== (last hand) 11) 
    (map-indexed 
      (fn [idx itm] 
        (if (= idx (- (count hand) 1)) 
          (* 2 itm) 
          itm)) 
     hand) 
    hand)
  )
