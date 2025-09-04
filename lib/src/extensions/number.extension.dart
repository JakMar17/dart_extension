import "dart:math";

/**
 * Extension methods for nullable double values.
 */
extension DartExtensionDoubleExtension on double? {
  /**
   * Returns the value of this double if it is not null or zero, otherwise returns 1.
   *
   * Useful for avoiding division by zero or null.
   *
   * @return The value of this double, or 1 if it is null or zero.
   */
  double get divisor => (this == 0 || this == null) ? 1 : this!;

  /**
   * Returns the value in cents (multiplied by 100), or 0 if null.
   */
  double get cents => (this ?? 0) * 100;
}

/**
 * Extension methods for nullable num values.
 */
extension DartExtensionNumNullableExtension on num? {
  /**
   * Returns the value of this num if it is not null or zero, otherwise returns 1.
   *
   * Useful for avoiding division by zero or null.
   *
   * @return The value of this num, or 1 if it is null or zero.
   */
  num get divisor => (this == 0 || this == null) ? 1 : this!;
}

/**
 * Extension methods for non-nullable num values.
 */
extension DartExtensionNumExtension on num {
  /**
   * Returns the order of magnitude of the number.
   *
   * If the number is 0, NaN, or infinite, returns 1.
   * For numbers with absolute value less than 1, returns the rounded logarithm base 10 multiplied by the sign.
   * For other numbers, returns the rounded logarithm base 10 minus 1.
   */
  int get magnitude {
    if (this == 0 || isNaN || isInfinite) {
      return 1;
    }
    if (abs() < 1) {
      return (log(abs()) / ln10).round() * sign.toInt();
    } else {
      return (log(abs()) / ln10).round() - 1;
    }
  }

  /**
   * Floors the number to the nearest multiple of the given factor.
   *
   * @param factor The factor to which the number should be floored.
   * @return The floored value as a double.
   */
  double floorToFactor(num factor) {
    return (this ~/ factor * factor).toDouble();
  }
}
