object SecretHandshake {
  val actions: List[String] = List("wink", "double blink", "close your eyes", "jump")
  def commands(number: Int): List[String] = {
    val result = actions
                 .zipWithIndex
                 .filter { case (action, index) =>
                    (1 << index & number) != 0
                 }.map(_._1)
  
    if ((1 << 4 & number) != 0) result.reverse 
    else result
  }
}