.strand 
| split("")
| if any(. != "A" and . != "G" and . != "T" and . != "C")
  then "Invalid nucleotide in strand" | halt_error
  else
    { 
      "A": (map(select(. == "A")) | length),
      "G": (map(select(. == "G")) | length),
      "C": (map(select(. == "C")) | length),
      "T": (map(select(. == "T")) | length)
    }
  end
