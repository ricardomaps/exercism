object Isogram {

    fun isIsogram(input: String): Boolean {
        val letters = input.lowercase().toCharArray().filter{ it.isLetter() }
        return letters.distinct().size == letters.size
    }
}
