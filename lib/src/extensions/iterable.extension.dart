/**
 * Extension methods for Iterable collections.
 *
 * Provides additional utility methods for working with Iterables.
 */
extension DartExtensionIterableExtension<T> on Iterable<T> {
  /**
   * Maps each element of the iterable to a new value and returns the result as a list.
   *
   * @param mappingFn A function that maps each element to a new value.
   * @return A list containing the mapped values.
   */
  List<R> mapToList<R>(R Function(T) mappingFn) {
    return map(mappingFn).toList();
  }

  /**
   * Maps each element of the iterable to a new value, including the index of the element.
   *
   * @param convert A function that maps each element and its index to a new value.
   * @return An iterable containing the mapped values.
   */
  Iterable<R> _mapIndexed<R>(R Function(int index, T element) convert) sync* {
    var index = 0;
    for (final element in this) {
      yield convert(index++, element);
    }
  }

  /**
   * Maps each element of the iterable to a new value, including the index of the element,
   * and returns the result as a list.
   *
   * @param mappingFn A function that maps each element and its index to a new value.
   * @return A list containing the mapped values.
   */
  List<R> mapIndexedToList<R>(R Function(int index, T element) mappingFn) {
    return _mapIndexed(mappingFn).toList();
  }

  /**
   * Maps each element of the iterable to a new value, including information about whether
   * the element is the first or last in the iterable.
   *
   * @param mappingFn A function that maps each element, along with its position as first or last, to a new value.
   * @return An iterable containing the mapped values.
   */
  Iterable<R> mapWithFirstLast<R>(
    R Function({
      required T element,
      required bool isFirst,
      required bool isLast,
    })
    mappingFn,
  ) sync* {
    for (int i = 0; i < length; i++) {
      yield mappingFn(
        element: elementAt(i),
        isFirst: i == 0,
        isLast: i == length - 1,
      );
    }
  }

  /**
   * Maps each element of the iterable to a new value, including its index and information
   * about whether the element is the first or last in the iterable.
   *
   * @param mappingFn A function that maps each element, its index, and its position as first or last, to a new value.
   * @return An iterable containing the mapped values.
   */
  Iterable<R> mapIndexedWithFirstLast<R>(
    R Function({
      required int index,
      required T element,
      required bool isFirst,
      required bool isLast,
    })
    mappingFn,
  ) sync* {
    for (int i = 0; i < length; i++) {
      yield mappingFn(
        index: i,
        element: elementAt(i),
        isFirst: i == 0,
        isLast: i == length - 1,
      );
    }
  }

  /**
   * Filters the elements of the iterable based on a test function and returns the result as a list.
   *
   * @param test A function that determines whether an element should be included.
   * @return A list containing the elements that satisfy the test function.
   */
  List<T> whereToList(bool Function(T) test) {
    return where(test).toList();
  }

  /**
   * Filters the elements of the iterable based on a test function that includes the index of the element.
   *
   * @param test A function that determines whether an element should be included, based on its index and value.
   * @return An iterable containing the elements that satisfy the test function.
   */
  Iterable<T> whereIndexed(bool Function(int index, T element) test) sync* {
    var index = 0;
    for (final element in this) {
      if (test(index++, element)) yield element;
    }
  }

  /**
   * Filters the elements of the iterable based on a test function that includes the index of the element,
   * and returns the result as a list.
   *
   * @param test A function that determines whether an element should be included, based on its index and value.
   * @return A list containing the elements that satisfy the test function.
   */
  List<T> whereToListIndexed(bool Function(int index, T element) test) {
    return whereIndexed(test).toList();
  }

  /**
   * Executes an action for each element of the iterable and yields the element.
   *
   * @param action A function to execute for each element.
   * @return An iterable containing the original elements.
   */
  Iterable<T> peek(void Function(T) action) sync* {
    for (final element in this) {
      action(element);
      yield element;
    }
  }

  /**
   * Returns the last element of the iterable, or null if the iterable is empty.
   *
   * @return The last element of the iterable, or null if the iterable is empty.
   */
  T? lastOrNull() => isNotEmpty ? last : null;

  /**
   * Replaces elements in the iterable that satisfy a given test with a new value.
   *
   * @param test A function that determines whether an element should be replaced.
   * @param replaceWith A function that provides the new value for elements that satisfy the test.
   * @return An iterable containing the modified elements.
   */
  Iterable<T> replaceWhere(
    bool Function(T element) test,
    T Function(T element) replaceWith,
  ) sync* {
    for (final element in this) {
      if (test(element)) {
        yield replaceWith(element);
      } else {
        yield element;
      }
    }
  }

  /**
   * Returns a new iterable containing all elements that do not satisfy the given test.
   *
   * @param test A function that determines whether an element should be excluded.
   * @return An iterable containing the elements that did not pass the test.
   */
  Iterable<T> whereNot(bool Function(T element) test) sync* {
    for (final element in this) {
      if (!test(element)) {
        yield element;
      }
    }
  }

  /**
   * Returns a new list containing all elements that do not satisfy the given test.
   *
   * @param test A function that determines whether an element should be excluded.
   * @return A list containing the elements that did not pass the test.
   */
  List<T> whereNotToList(bool Function(T element) test) =>
      whereNot(test).toList();
}
