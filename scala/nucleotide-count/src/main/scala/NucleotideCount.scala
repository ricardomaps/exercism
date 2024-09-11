class DNA(val strand: String) {
  val nucleotides: String = "AGCT"
  def nucleotideCounts: Either[String, Map[Char, Int]] = {
    val initMap = Map('A' -> 0, 'T' -> 0, 'G' -> 0, 'C' -> 0)
    if (!strand.forall(n => nucleotides.contains(n))) Left("Invalid strand")
    else Right(initMap ++ strand.groupBy(identity).map { case (k, v) => (k, v.length) })
          
  }
  
}