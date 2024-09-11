object CollatzConjecture {
  def steps(number: Int, stepCount: Int = 0): Option[Int] = {
    if (number < 1) None
    else if (number == 1) Some(stepCount)
    else if (number % 2 == 0) steps(number/2, stepCount+1)
    else steps(3*number+1, stepCount+1)
  }
}