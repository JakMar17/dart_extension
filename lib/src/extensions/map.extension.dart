/**
 * Extension methods for [Map] to provide additional utility functions.
 * @template K - The type of the map's keys.
 * @template V - The type of the map's values.
 */
extension DartUtilBoxMapExtension<K, V> on Map<K, V> {
  /**
   * Returns a new map containing all entries that satisfy the given test.
   *
   * @param {function(K, V): boolean} test - A function that is called with each key and value, and returns a boolean.
   * @returns {Map<K, V>} A new map containing the entries that passed the test.
   */
  Map<K, V> where(bool Function(K key, V value) test) {
    final Map<K, V> result = {};
    for (final entry in entries) {
      if (test(entry.key, entry.value)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  /**
   * Returns a new map containing all entries that do not satisfy the given test.
   *
   * @param {function(K, V): boolean} test - A function that is called with each key and value, and returns a boolean.
   * @returns {Map<K, V>} A new map containing the entries that did not pass the test.
   */
  Map<K, V> whereNot(bool Function(K key, V value) test) =>
      where((key, value) => !test(key, value));

  /**
   * Returns the first entry that satisfies the given test.
   *
   * @param {function(K, V): boolean} test - A function called with each key and value.
   * @returns {MapEntry<K, V>} The first entry that satisfies the condition.
   * @throws {StateError} If no entry satisfies the condition.
   */
  MapEntry<K, V> firstWhere(bool Function(K key, V value) test) {
    for (final entry in entries) {
      if (test(entry.key, entry.value)) {
        return MapEntry(entry.key, entry.value);
      }
    }
    throw StateError("No element satisfies the condition");
  }

  /**
   * Returns the first entry that does not satisfy the given test.
   *
   * @param {function(K, V): boolean} test - A function called with each key and value.
   * @returns {MapEntry<K, V>} The first entry that does not satisfy the condition.
   * @throws {StateError} If all entries satisfy the condition.
   */
  MapEntry<K, V> firstWhereNot(bool Function(K key, V value) test) =>
      firstWhere((key, value) => !test(key, value));

  /**
   * Returns the first entry that satisfies the given test, or `null` if none found.
   *
   * @param {function(K, V): boolean} test - A function called with each key and value.
   * @returns {MapEntry<K, V> | null} The first entry or `null`.
   */
  MapEntry<K, V>? firstWhereOrNull(bool Function(K key, V value) test) {
    for (final entry in entries) {
      if (test(entry.key, entry.value)) {
        return MapEntry(entry.key, entry.value);
      }
    }
    return null;
  }

  /**
   * Returns the first entry that does not satisfy the given test, or `null` if none found.
   *
   * @param {function(K, V): boolean} test - A function called with each key and value.
   * @returns {MapEntry<K, V> | null} The first entry or `null`.
   */
  MapEntry<K, V>? firstWhereNotOrNull(bool Function(K key, V value) test) =>
      firstWhereOrNull((key, value) => !test(key, value));

  /**
   * Returns the first key that satisfies the given test.
   *
   * @param {function(K): boolean} test - A function called with each key.
   * @returns {K} The first key that satisfies the condition.
   * @throws {StateError} If no key satisfies the condition.
   */
  K firstKeyWhere(bool Function(K key, V value) test) =>
      firstWhere((key, value) => test(key, value)).key;

  /**
   * Returns the first key that does not satisfy the given test.
   *
   * @param {function(K): boolean} test - A function called with each key.
   * @returns {K} The first key that does not satisfy the condition.
   * @throws {StateError} If all keys satisfy the condition.
   */
  K firstKeyWhereNot(bool Function(K key, V value) test) =>
      firstWhereNot((key, value) => test(key, value)).key;

  /**
   * Returns the first key that satisfies the given test, or `null` if none found.
   *
   * @param {function(K): boolean} test - A function called with each key.
   * @returns {K | null} The first key or `null`.
   */
  K? firstKeyWhereOrNull(bool Function(K key, V value) test) =>
      firstWhereOrNull((key, value) => test(key, value))?.key;

  /**
   * Returns the first key that does not satisfy the given test, or `null` if none found.
   *
   * @param {function(K): boolean} test - A function called with each key.
   * @returns {K | null} The first key or `null`.
   */
  K? firstKeyWhereNotOrNull(bool Function(K key, V value) test) =>
      firstWhereNotOrNull((key, value) => test(key, value))?.key;

  /**
   * Returns the first value that satisfies the given test.
   *
   * @param {function(V): boolean} test - A function called with each value.
   * @returns {V} The first value that satisfies the condition.
   * @throws {StateError} If no value satisfies the condition.
   */
  V firstValueWhere(bool Function(K key, V value) test) =>
      firstWhere((key, value) => test(key, value)).value;

  /**
   * Returns the first value that does not satisfy the given test.
   *
   * @param {function(V): boolean} test - A function called with each value.
   * @returns {V} The first value that does not satisfy the condition.
   */
  V firstValueWhereNot(bool Function(K key, V value) test) =>
      firstWhereNot((key, value) => test(key, value)).value;

  /**
   * Returns the first value that satisfies the given test, or `null` if none found.
   *
   * @param {function(V): boolean} test - A function called with each value.
   * @returns {V | null} The first value or `null`.
   */
  V? firstValueWhereOrNull(bool Function(K key, V value) test) =>
      firstWhereOrNull((key, value) => test(key, value))?.value;

  /**
   * Returns the first value that does not satisfy the given test, or `null` if none found.
   *
   * @param {function(V): boolean} test - A function called with each value.
   * @returns {V | null} The first value or `null`.
   */
  V? firstValueWhereNotOrNull(bool Function(K key, V value) test) =>
      firstWhereNotOrNull((key, value) => test(key, value))?.value;

  /**
   * Returns a new map with the same keys and values transformed by a function.
   *
   * @template NV - The type of the new map's values.
   * @param {function(V): NV} transform - A function called with each value to transform it.
   * @returns {Map<K, NV>} A new map with the transformed values.
   */
  Map<K, NV> mapValues<NV>(NV Function(V value) transform) {
    final Map<K, NV> result = {};
    for (final entry in entries) {
      result[entry.key] = transform(entry.value);
    }
    return result;
  }

  /**
   * Returns a new map with the same values and keys transformed by a function.
   *
   * @template NK - The type of the new map's keys.
   * @param {function(K): NK} transform - A function called with each key to transform it.
   * @returns {Map<NK, V>} A new map with the transformed keys.
   */
  Map<NK, V> mapKeys<NK>(NK Function(K key) transform) {
    final Map<NK, V> result = {};
    for (final entry in entries) {
      result[transform(entry.key)] = entry.value;
    }
    return result;
  }

  /**
   * Transforms each key-value pair in the map using the provided function and returns the results as a list.
   *
   * @template L - The type of the elements in the resulting list.
   * @param {function(K, V): L} transform - A function called with each key and value to transform them into a new form.
   * @returns {List<L>} A list containing the transformed elements.
   */
  List<L> mapToList<L>(L Function(K key, V value) transform) {
    final List<L> result = [];
    for (final entry in entries) {
      result.add(transform(entry.key, entry.value));
    }
    return result;
  }
}
