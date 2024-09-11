
enum class Classification {
    DEFICIENT, PERFECT, ABUNDANT
}

fun aliquotSum(naturalNumber: Int): Int = 1.rangeUntil(naturalNumber).filter{ naturalNumber % it == 0 }.sum()

fun classify(naturalNumber: Int): Classification {
    require(naturalNumber > 0)
    val aliquot = aliquotSum(naturalNumber)
    return when {
        aliquot == naturalNumber -> Classification.PERFECT
        aliquot < naturalNumber -> Classification.DEFICIENT
        else -> Classification.ABUNDANT
    }
}
