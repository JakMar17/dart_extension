/**
 * Extension methods for the DateTime class to provide additional date and time utilities.
 */
extension DartExtensionDateTimeExtension on DateTime {
  /// Returns a new DateTime representing the start of the day (00:00:00).
  DateTime get startOfDay => DateTime(year, month, day);

  /// Returns a new DateTime representing the start of the week (Monday, 00:00:00).
  DateTime get startOfWeek => DateTime(year, month, day - (weekday - 1));

  /// Returns a new DateTime representing the start of the month (first day, 00:00:00).
  DateTime get startOfMonth => DateTime(year, month);

  /// Returns a new DateTime representing the start of the year (January 1st, 00:00:00).
  DateTime get startOfYear => DateTime(year);

  /// Returns the number of days in the current month.
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// Returns the number of minutes since midnight.
  int get dayMinute => hour * 60 + minute;

  /**
   * Returns a new DateTime with the specified number of days added.
   *
   * @param days The number of days to add.
   * @return A new DateTime with the days added.
   */
  DateTime addDays(int days) => copyWith(day: day + days);

  /**
   * Returns a new DateTime with the specified number of months added.
   *
   * @param months The number of months to add.
   * @return A new DateTime with the months added.
   */
  DateTime addMonths(int months) => copyWith(month: month + months);

  /**
   * Returns a new DateTime with the specified number of years added.
   *
   * @param years The number of years to add.
   * @return A new DateTime with the years added.
   */
  DateTime addYears(int years) => copyWith(year: year + years);

  /**
   * Converts the DateTime to UTC, adjusting for the local time zone offset.
   *
   * @return A new DateTime in UTC.
   */
  DateTime asUtc() {
    final offset = toLocal().timeZoneOffset;
    return toUtc().add(offset);
  }

  /**
   * Compares the time (hour, minute, second, millisecond, microsecond) of this DateTime with another.
   * Ignores the date part.
   *
   * @param other The DateTime to compare with.
   * @return True if the times are equal, false otherwise.
   */
  bool isTimeEqual(DateTime other) {
    final thisHour = copyWith(year: 1970, month: 1, day: 1);
    final otherHour = other.copyWith(year: 1970, month: 1, day: 1);
    return thisHour.isAtSameMomentAs(otherHour);
  }

  /**
   * Checks if the time of this DateTime is before the time of another DateTime.
   * Ignores the date part.
   *
   * @param other The DateTime to compare with.
   * @return True if this time is before the other, false otherwise.
   */
  bool isTimeBefore(DateTime other) {
    final thisHour = copyWith(year: 1970, month: 1, day: 1);
    final otherHour = other.copyWith(year: 1970, month: 1, day: 1);
    return thisHour.isBefore(otherHour);
  }

  /**
   * Checks if the time of this DateTime is after the time of another DateTime.
   * Ignores the date part.
   *
   * @param other The DateTime to compare with.
   * @return True if this time is after the other, false otherwise.
   */
  bool isTimeAfter(DateTime other) {
    final thisHour = copyWith(year: 1970, month: 1, day: 1);
    final otherHour = other.copyWith(year: 1970, month: 1, day: 1);
    return thisHour.isAfter(otherHour);
  }
}
