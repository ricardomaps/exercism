object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] = {
    if (dnaStrandOne.length != dnaStrandTwo.length) return None
    val distance = dnaStrandOne zip dnaStrandTwo count {letters => letters._1 != letters._2}
    Some(distance)
}
}
