object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        require(start > 0)
        return computeStepCount(start, 0)
    }
    private tailrec fun computeStepCount(n: Int, count: Int): Int =
        when {
            n == 1 -> count
            n % 2 == 0 -> computeStepCount(n/2, count + 1)
            else -> computeStepCount(3*n+1, count + 1)
        }
}
