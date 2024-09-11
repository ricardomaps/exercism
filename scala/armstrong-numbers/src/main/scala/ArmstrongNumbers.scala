import scala.math.pow

object ArmstrongNumbers {
  def isArmstrongNumber(number: Int) : Boolean = {
    val numAsString = number.toString
    val length = numAsString.length
    numAsString
          .map(digit => pow(digit.asDigit, length).asInstanceOf[Int])
          .sum
          .equals(number)
  }
}