.strand 
| if test("[^AGTC]")
  then "Invalid nucleotide in strand" | halt_error
  else
    split("")
    | { 
      "A": (map(select(. == "A")) | length),
      "G": (map(select(. == "G")) | length),
      "C": (map(select(. == "C")) | length),
      "T": (map(select(. == "T")) | length)
    }
  end
