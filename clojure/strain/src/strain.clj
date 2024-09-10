(ns strain)

(defn retain [f l] 
  (for 
    [
     el l
    :when (f el)
     ]
    el))

(defn discard [f l]
  (for 
    [
     el l
    :when (not (f el))
     ]
    el)
)
