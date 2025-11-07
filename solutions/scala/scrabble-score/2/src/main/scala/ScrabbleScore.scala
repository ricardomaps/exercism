object ScrabbleScore {
  def score(word: String): Int =
    word.toUpperCase.map { letter => 
      letter match {
        case 'D' | 'G' => 2
        case 'B' | 'C' | 'M' | 'P' => 3
        case 'F' | 'H' | 'V' | 'W' | 'Y' => 4
        case 'K' => 5
        case 'J' | 'X' => 8
        case 'Q' | 'Z' => 10
        case _ => 1
      }
    }.sum
}