class Squares(val num: Int) {

    fun sumOfSquares(): Int {
        return (1..num).sumOf { it * it }
    }

    fun squareOfSum(): Int {
        val sumOfNums = (1..num).sum()
        return sumOfNums * sumOfNums
    }

    fun difference(): Int {
        return squareOfSum() - sumOfSquares()
    }
}
