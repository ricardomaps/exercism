(ns rna-transcription)

(def dna-to-rna 
  {\A \U
   \T \A
   \G \C
   \C \G})

(defn to-rna [dna] 
  (->>
    (map (fn [nucl] (let [rna (get dna-to-rna nucl)]
                      (do
                        (assert (not (nil? rna)))
                        rna)))dna)
    (apply str)))
