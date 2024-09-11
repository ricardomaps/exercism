object RnaTranscription {
  def toRna(strand: String): Option[String] = {
    def findComplement(nucleotides: Seq[Char], rnaComplement: List[Char]): Option[String] = {
      nucleotides.headOption match{
        case None => Some(rnaComplement.mkString(""))
        case Some(nucleotide) => nucleotide match{
          case 'A' => findComplement(nucleotides.tail, rnaComplement :+ 'U')
          case 'T' => findComplement(nucleotides.tail, rnaComplement :+ 'A')
          case 'C' => findComplement(nucleotides.tail, rnaComplement :+ 'G')
          case 'G' => findComplement(nucleotides.tail, rnaComplement :+ 'C')
          case _ => None
        }
      }
    }
  findComplement(strand, List[Char]())
  }
}