object BinarySearch {
  def find(songs: List[Int], favoriteNumber: Int): Option[Int] = {
    def  binSearch(lo: Int, hi: Int): Option[Int] = {
      if(hi < lo) return None
      val index = (lo+hi)/2
      if(songs(index) == favoriteNumber) Some(index)
      else if(songs(index) < favoriteNumber) binSearch(index+1, hi)
      else binSearch(lo, index-1)
    }
    binSearch(0, songs.length-1)
  }
}