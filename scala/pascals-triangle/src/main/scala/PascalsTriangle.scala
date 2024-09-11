object PascalsTriangle{
  def rows(numberOfRows: Int): List[List[Int]] = {
    if(numberOfRows <= 0) Nil
    else List.iterate(List(1), numberOfRows) {prev => 0 +: prev zip prev :+ 0 map Function.tupled(_ + _)}
  }
}