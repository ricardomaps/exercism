object Series {
  def slices(n: Int, s: String): List[List[Int]] = {
     s.toList.map(_.asDigit).sliding(n).toList
  }
}