object Leap {
  def divisibleBy400(y: Int): Boolean = y % 400 == 0
  def divisibleBy100(y: Int): Boolean = y % 100 == 0
  def divisibleBy4(y: Int): Boolean = y % 4 == 0
  def leapYear(year: Int): Boolean =
    divisibleBy4(year) && (!divisibleBy100(year) || divisibleBy400(year))
}
