import scala.annotation.tailrec

sealed trait SimpleLinkedList[+T] {
  def isEmpty: Boolean = {
    this match {
      case Empty => true
      case Node(_, _) => false
    }
  }

  def value: T = {
    this match {
      case Empty => throw new Exception("Empty List")
      case Node(value, _) => value
    }
  }

  def add[S >: T](item: S): SimpleLinkedList[S] = {
    this match {
      case Empty => Node(item, this)
      case Node(value, next) => Node(value, next.add(item))
    }
  }

  def next: SimpleLinkedList[T] = {
    this match {
      case Empty => throw new Exception("Empty List")
      case Node(_, next) => next
    }
  }

  def reverse: SimpleLinkedList[T] = {
    @tailrec
    def go(accumulator: SimpleLinkedList[T], current: SimpleLinkedList[T]): SimpleLinkedList[T] = {
      current match {
        case Empty => accumulator
        case Node(value, next) => go(Node(value, accumulator), next)
      }
    }
    go(Empty, this)
  }
  def toSeq: Seq[T] = {
    @tailrec
    def go(accumulator: Seq[T], current: SimpleLinkedList[T]): Seq[T] = {
      current match {
        case Empty => accumulator.reverse
        case Node(value, next) => go(value +: accumulator, next)
      }
    }
    go(Seq(), this)
  }
}

object SimpleLinkedList {
  def apply[T](elements: T*): SimpleLinkedList[T] = fromSeq(elements)

  def fromSeq[T](seq: Seq[T]): SimpleLinkedList[T] = {
    @tailrec
    def go(accumulator: SimpleLinkedList[T], current: Seq[T]): SimpleLinkedList[T] = {
      current match {
        case head :: next => go(Node(head, accumulator), next)
        case _ => accumulator.reverse
      }
    }
    go(Empty, seq)
  }
}

case class Node[+T](v: T, n: SimpleLinkedList[T]) extends SimpleLinkedList[T]
case object Empty extends SimpleLinkedList[Nothing]