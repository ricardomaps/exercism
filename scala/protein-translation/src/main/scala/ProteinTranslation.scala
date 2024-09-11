object ProteinTranslation {
  private val translations = Map("AUG" -> "Methionine", "UUU" -> "Phenylalanine", "UUC" -> "Phenylalanine", "UUA" -> "Leucine", "UUG" -> "Leucine", "UCU" -> "Serine", "UCC" -> "Serine", "UCA" -> "Serine", "UCG" -> "Serine", "UAU" -> "Tyrosine", "UAC" -> "Tyrosine", "UGU" -> "Cysteine", "UGC" -> "Cysteine","UGG" -> "Tryptophan", "UAA" -> "STOP", "UAG" -> "STOP", "UGA" -> "STOP")
  def proteins(strand: String): List[String] = {
    strand.grouped(3).map(translations(_)).span(_ != "STOP")._1.toList
  }
}