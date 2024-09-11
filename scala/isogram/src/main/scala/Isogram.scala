object Isogram {
  def isIsogram(phrase: String): Boolean = {
    val normalized = phrase.toLowerCase.filter(_.isLetter)
    val uniqueLetters = normalized.distinct.length
    val totalLetters = normalized.length
    uniqueLetters == totalLetters 
  }
}