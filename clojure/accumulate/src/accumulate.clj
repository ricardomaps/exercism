(ns accumulate)

(defn accumulate [func coll]
  (for [item coll] (func item)))
