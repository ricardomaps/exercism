class Accumulate {
  def accumulate[A, B](f: (A) => B, list : List[A], acc: List[B] = List()): List[B] = {
    list.headOption match{
      case Some(el) => accumulate(f, list.tail, f(el)::acc)
      case None => acc.reverse
    }
  }
}
