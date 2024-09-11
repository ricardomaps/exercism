object Etl {
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] = scoreMap.toSeq.flatMap(pair => pair._2.map(letter => letter.toLowerCase -> pair._1)).toMap
}
