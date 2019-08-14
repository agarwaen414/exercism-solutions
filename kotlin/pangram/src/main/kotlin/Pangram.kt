import java.util.Arrays

object Pangram {
  fun isPangram(str: String): Boolean {
    val alphabet = CharArray(26) { (it + 97).toChar() }
    println(Arrays.toString(alphabet))

    return false
  }
}
