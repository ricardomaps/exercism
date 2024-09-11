import kotlin.math.pow
object ArmstrongNumber {
    fun check(input: Int): Boolean {
        val stringInput = input.toString()
        val numDigits = stringInput.length
        val armstrongSum = stringInput.map{ it.digitToInt().toDouble().pow(numDigits).toInt() }.sum()
        return armstrongSum == input
    }

}
