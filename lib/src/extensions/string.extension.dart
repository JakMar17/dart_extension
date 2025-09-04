/**
 * Extension methods for the String class to provide additional utilities.
 */
extension DartExtensionStringExtension on String {
  /**
   * Returns a copy of the string with the first character in uppercase.
   * If the string is empty, this will throw an error.
   */
  String get capitalize {
    return toUpperCase()[0] + substring(1);
  }

  /**
   * Removes trailing zeros after the decimal point in a numeric string.
   * For example, "12.3400" becomes "12.34" and "15.000" becomes "15".
   */
  String get clearTrailingZeros {
    return replaceAll(RegExp(r"(\.0+|(?<=\..*)0+)$"), "");
  }

  /**
   * Parses the string as a DateTime and converts it to the local time zone.
   * Returns null if the string cannot be parsed.
   */
  DateTime? get toLocalDate => DateTime.tryParse(this)?.toLocal();

  /**
   * Parses the string as a DateTime, ignoring any timezone information.
   * Returns null if the string cannot be parsed.
   */
  DateTime? get toDateIgnoreTimezone => DateTime.tryParse(split("+").first);
}
