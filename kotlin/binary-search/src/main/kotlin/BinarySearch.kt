object BinarySearch {
    fun search(list: List<Int>, item: Int): Int {
        var l = 0
        var r = list.size - 1
        while (l <= r) {
            var m = (l+r)/2
            if (list[m] == item) return m
            if (list[m] < item) l = m + 1
            else r = m - 1
        }
        throw NoSuchElementException()
    }
}
