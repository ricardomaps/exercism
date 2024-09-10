(ns coordinate-transformation)

(defn translate2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [coordX coordY]
    [(+ dx coordX) (+ dy coordY)]))

(defn scale2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [dimX dimY] [(* dimX sx) (* dimY sy)]))

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x y] (apply g (f x y))))

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [arg1 (atom nil) arg2 (atom nil) result (atom nil)]
    (fn [x y]
      (if (and (= x @arg1)(= y @arg2))
        @result
        (let [new-result (f x y)]
          (swap! result (fn [_] new-result))
          (swap! arg1 (fn [_] x))
          (swap! arg2 (fn [_] y))
          @result)))))
