(ns protein-translation)

(defn translate-codon
  "Returns the protein which the rna codon translates to"
  [codon]
  (case codon
    "AUG" "Methionine"
    ("UUU" "UUC") "Phenylalanine"
    ("UUA" "UUG") "Leucine"
    ("UCU" "UCC" "UCA" "UCG") "Serine"
    ("UAU" "UAC") "Tyrosine"
    ("UGU" "UGC") "Cysteine"
    "UGG" "Tryptophan"
    ("UAA" "UAG" "UGA") "STOP"))

(defn translate-rna
  "Returns the protein sequence of the input rna after translation"
  [strand]
  (->>
   strand
   (partition 3)
   (map (partial apply str))
   (map translate-codon)
   (take-while #(not= "STOP" %))))

