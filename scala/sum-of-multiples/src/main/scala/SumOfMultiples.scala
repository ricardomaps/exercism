object SumOfMultiples {
  def sum(factors: Set[Int], limit: Int): Int = {
    factors.foldLeft(Set(): Set[Int]) { (acc, baseValue) =>
      acc concat (1 to limit).map(_*baseValue).takeWhile(_ < limit)
    }.sum
  }
}

