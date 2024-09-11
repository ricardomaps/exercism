import scala.collection.mutable.{Map => MMap}
class School {
  type DB = Map[Int, Seq[String]]
  val _db : DB = MMap()
  
  def add(name: String, g: Int) = 
    if (_db.contains(g)) {
      _db(g) = name :: _db(g)
    }else{
      _db(g) = Seq(name)
    }

  def db: DB = _db

  def grade(g: Int): Seq[String] = _db(g)

  def sorted: DB = ???
}

