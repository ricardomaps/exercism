fun toRna(nucleotide: Char): Char = 
    when(nucleotide) {
        'A' -> 'U'
        'T' -> 'A'
        'C' -> 'G'
        'G' -> 'C'
        else -> throw IllegalArgumentException("invalid dna strand")
    }

fun transcribeToRna(dna: String): String = dna.map{ toRna(it) }.joinToString("")
