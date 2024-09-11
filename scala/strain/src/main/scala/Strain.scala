object Strain {
  def keep[T](list: Seq[T], predicate: (T) => Boolean): Seq[T] = {
    for(element <- list if predicate(element))
    yield element
  }
  def discard[T](list: Seq[T], predicate: (T) => Boolean): Seq[T] = {
    for(element <- list if !predicate(element))
    yield element
  }
}