object DifferenceOfSquares {

  def sumOfSquares(n: Int): Int = (1 to n).map(num => num * num).sum

  def squareOfSum(n: Int): Int = {
    val _sum = (1 to n).sum
    _sum * _sum
  }

  def differenceOfSquares(n: Int): Int = squareOfSum(n) - sumOfSquares(n)
}
