/**
 * Extension methods for List collections.
 *
 * Provides additional utility methods for working with Lists.
 */
extension DartUtilBoxListExtension<T> on List<T> {
  /**
   * Adds an element to the list if the specified condition is met.
   *
   * @param element The element to be added to the list.
   * @param isConditionMet A required boolean that determines whether the element should be added.
   */
  void addIf(T element, {required bool isConditionMet}) {
    if (isConditionMet) {
      add(element);
    }
  }

  /**
   * Separates the list into two lists: one containing elements at odd indices
   * and the other containing elements at even indices.
   *
   * @return A record containing two lists: 'odd' with elements at odd indices,
   *         and 'even' with elements at even indices.
   */
  ({List<T> odd, List<T> even}) get oddEven {
    final List<T> odd = [];
    final List<T> even = [];

    for (int i = 0; i < length; i++) {
      if (i.isEven) {
        even.add(this[i]);
      } else {
        odd.add(this[i]);
      }
    }

    return (odd: odd, even: even);
  }

  /**
   * Inserts a specified element between each element of the list and returns the result as a new list.
   *
   * If the list has fewer than two elements, it returns a copy of the original list.
   *
   * @param element The element to be inserted between each element of the list.
   * @return A new list with the specified element inserted between each element of the original list.
   */
  List<T> insertBetween(T element) => length < 2
      ? List<T>.from(this)
      : expand((item) => [item, element]).take(length * 2 - 1).toList();
}
