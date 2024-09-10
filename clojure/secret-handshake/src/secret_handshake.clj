(ns secret-handshake)

(def actions ["wink" "double blink" "close your eyes" "jump"])

(defn get-actions [n]
  (keep-indexed #(when (bit-test n %1) %2) actions))

(defn commands [n] 
  (let [acts (get-actions n)]
    (if (bit-test n 4) 
      (reverse acts)
      acts)))
