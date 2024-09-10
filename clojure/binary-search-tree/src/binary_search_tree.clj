(ns binary-search-tree)

(defn value [tree-node]
  (:value tree-node))

(defn singleton [value]
  {:value value :left nil :right nil})

(defn insert [value root]
  (cond
    (nil? root) (singleton value)
    (> value (:value root)) (update root :right (partial insert value))
    :else (update root :left (partial insert value))))

(defn left [tree-node]
  (:left tree-node))

(defn right [tree-node] 
  (:right tree-node))

(defn to-list [root]
  (if (nil? root) []
    (concat (to-list (:left root)) [(:value root)] (to-list (:right root)))))

(defn from-list [l] 
  (reduce #(insert %2 %1) nil l))
