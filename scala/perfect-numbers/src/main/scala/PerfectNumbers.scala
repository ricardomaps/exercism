sealed trait NumberType

object NumberType {
  object Abundant extends NumberType
  object Deficient extends NumberType
  object Perfect extends NumberType
}

object PerfectNumbers {
  def classify(num: Int): Either[String, NumberType] = {
    if(num < 1) return Left("Classification is only possible for natural numbers.")
    val aliquotSum = (1 until num).filter(num % _ == 0).sum
    if(aliquotSum == num) Right(NumberType.Perfect)
    else if(aliquotSum < num) Right(NumberType.Deficient)
    else Right(NumberType.Abundant)
  }
}