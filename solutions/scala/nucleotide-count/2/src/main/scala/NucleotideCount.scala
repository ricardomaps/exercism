class DNA(val strand: String) {
  val nucleotides: String = "AGCT"
  def nucleotideCounts: Either[String, Map[Char, Int]] = {
    val initMap = Map('A' -> 0, 'T' -> 0, 'G' -> 0, 'C' -> 0)
    if (!strand.forall(nucleotides.contains(_)))
      Left("Invalid strand")
    else 
      Right(initMap ++ strand.groupMapReduce(identity)(_ => 1)(_ + _))
          
  }
  
}