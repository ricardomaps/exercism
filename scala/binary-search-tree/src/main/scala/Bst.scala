case class Bst[T](value: T, left: Option[Bst[T]] = None, right: Option[Bst[T]] = None)
(implicit evidence: T => Ordered[T]) {
  def insert(newValue: T): Bst[T] = {
    if (newValue > value)
      copy(right = right.map(_.insert(newValue)).orElse(Option(Bst(newValue))))
    else
      copy(left = left.map(_.insert(newValue)).orElse(Option(Bst(newValue))))
  }
}
object Bst {
  def fromList[T](list: List[T])(implicit evidence: T => Ordered[T]): Bst[T] = {
    list.tail.foldLeft(Bst(list.head)) { case (bst, value) => bst.insert(value) }
  }
  def toList[T](bst: Bst[T]): List[T] = {
    def loop(bstOption: Option[Bst[T]]): List[T] = bstOption match {
      case None => Nil
      case Some(bst) => loop(bst.left) ++ (bst.value :: loop(bst.right))
    }
    loop(Option(bst))
  }
}