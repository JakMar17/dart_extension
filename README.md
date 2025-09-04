# Dart Extension

A **general-purpose Dart utility toolkit** that provides extensions for `DateTime`, `Iterable`, `List`, `String`, `num`, and `double` classes.

---

## Installation

Add this to your projects's `pubspec.yaml` file:

```yaml
dependencies:
  dart_util_box: ^1.0.0
```

Then run: 
```bash
dart pub get
```

Import it in you code:

```dart 
import 'package:dart_util_box/dart_util_box.dart';
```

## 📅 DateTime Extensions

This extension adds convenient utilities to Dart's built-in DateTime class.
It helps with date calculations, time comparisons, and manipulation.

### ✨ Features

**Start points**
- startOfDay → midnight of the current day
- startOfWeek → Monday, 00:00 of the current week
- startOfMonth → first day of the month, 00:00
- startOfYear → January 1st of the current year, 00:00

**Date info**
- daysInMonth → number of days in the month
- dayMinute → number of minutes since midnight

**Date shifting**
- addDays(int days) → add/subtract days
- addMonths(int months) → add/subtract months
- addYears(int years) → add/subtract years

**Timezone**
- asUtc() → converts to UTC while keeping the same local wall-clock time

**Time comparisons (ignores date part)**
- isTimeEqual(DateTime other)
- isTimeBefore(DateTime other)
- isTimeAfter(DateTime other)

### 🧑‍💻 Examples
```dart
import 'package:your_package/your_package.dart';

void main() {
  final now = DateTime(2025, 9, 4, 14, 30); // Sep 4, 2025 14:30

  // Start points
  print(now.startOfDay);   // 2025-09-04 00:00:00.000
  print(now.startOfWeek);  // 2025-09-01 00:00:00.000 (Monday)
  print(now.startOfMonth); // 2025-09-01 00:00:00.000
  print(now.startOfYear);  // 2025-01-01 00:00:00.000

  // Date info
  print(now.daysInMonth); // 30
  print(now.dayMinute);   // 870 (14*60 + 30)

  // Shifting
  print(now.addDays(5));    // 2025-09-09 14:30:00.000
  print(now.addMonths(2));  // 2025-11-04 14:30:00.000
  print(now.addYears(-1));  // 2024-09-04 14:30:00.000

  // Time comparisons
  final morning = DateTime(2025, 9, 4, 9, 0);
  print(now.isTimeAfter(morning));  // true
  print(now.isTimeBefore(morning)); // false
  print(now.isTimeEqual(morning));  // false
}
```

## 📚 Iterable Extensions

This extension adds **powerful utilities** to Dart's `Iterable` collections.  
It makes **mapping, filtering, replacing, and peeking** easier and more expressive.

---

### ✨ Features

**Mapping**
- `mapToList` → map elements directly into a `List`
- `mapIndexedToList` → map elements with their index into a `List`
- `mapWithFirstLast` → map elements with `isFirst` and `isLast` flags
- `mapIndexedWithFirstLast` → map elements with `index`, `isFirst`, and `isLast`

**Filtering**
- `whereToList` → filter elements into a `List`
- `whereIndexed` → filter with index-aware predicate
- `whereToListIndexed` → filter with index-aware predicate into a `List`
- `whereNot` → exclude elements by condition
- `whereNotToList` → exclude elements by condition into a `List`

**Utility**
- `peek` → run side-effects (like logging) while iterating
- `lastOrNull` → safely get last element or `null` if empty
- `replaceWhere` → replace elements that satisfy a condition

---

#### 🧑‍💻 Examples

```dart
import 'package:your_package/your_package.dart';

void main() {
  final numbers = [10, 20, 30, 40];

  // Mapping
  print(numbers.mapToList((n) => n * 2)); 
  // [20, 40, 60, 80]

  print(numbers.mapIndexedToList((i, n) => '$i:$n')); 
  // ['0:10', '1:20', '2:30', '3:40']

  print(numbers.mapWithFirstLast(({
    required element,
    required isFirst,
    required isLast,
  }) => '$element (${isFirst ? "first" : isLast ? "last" : "mid"})'));
  // ['10 (first)', '20 (mid)', '30 (mid)', '40 (last)']

  // Filtering
  print(numbers.whereToList((n) => n > 20)); 
  // [30, 40]

  print(numbers.whereIndexed((i, n) => i.isEven)); 
  // (10, 30)

  print(numbers.whereNotToList((n) => n == 20)); 
  // [10, 30, 40]

  // Utility
  numbers.peek((n) => print("Saw $n")).toList();
  // Logs: Saw 10, Saw 20, Saw 30, Saw 40

  print(numbers.lastOrNull()); 
  // 40

  print(numbers.replaceWhere((n) => n == 30, (_) => 99).toList()); 
  // [10, 20, 99, 40]
}
```

## 📝 List Extensions

This extension adds **extra utilities** to Dart's `List` collections.  
It helps with **conditional adds**, **odd/even grouping**, and **element insertion**.

---

### ✨ Features

- `addIf` → add an element only if a condition is met
- `oddEven` → split a list into two lists: elements at odd vs. even indices
- `insertBetween` → insert a given element between each item of the list

---

### 🧑‍💻 Examples

```dart
import 'package:your_package/your_package.dart';

void main() {
  final list = [1, 2, 3, 4, 5];

  // Conditional add
  list.addIf(6, isConditionMet: true);
  print(list); 
  // [1, 2, 3, 4, 5, 6]

  // Odd/Even split
  final result = list.oddEven;
  print(result.odd);  // [2, 4, 6]
  print(result.even); // [1, 3, 5]

  // Insert between
  final spaced = [10, 20, 30].insertBetween(0);
  print(spaced); 
  // [10, 0, 20, 0, 30]

  // Single-element list stays unchanged
  print([42].insertBetween(99)); 
  // [42]
}
```

## 🗂️ Map Extensions

This extension adds **utility methods** for working with Dart `Map<K, V>`.  
It provides **filtering, querying, and transforming** capabilities.

---

### ✨ Features

**Filtering**
- `where` → keep entries that pass a test
- `whereNot` → exclude entries that pass a test

**Entry queries**
- `firstWhere` / `firstWhereNot` → first entry matching / not matching a condition (throws if none)
- `firstWhereOrNull` / `firstWhereNotOrNull` → safe nullable versions

**Key queries**
- `firstKeyWhere` / `firstKeyWhereNot` → first key matching / not matching (throws if none)
- `firstKeyWhereOrNull` / `firstKeyWhereNotOrNull` → safe nullable versions

**Value queries**
- `firstValueWhere` / `firstValueWhereNot` → first value matching / not matching (throws if none)
- `firstValueWhereOrNull` / `firstValueWhereNotOrNull` → safe nullable versions

**Transformations**
- `mapValues` → transform values while keeping keys
- `mapKeys` → transform keys while keeping values
- `mapToList` → transform entries into a `List`

---

### 🧑‍💻 Examples

```dart
import 'package:your_package/your_package.dart';

void main() {
  final users = {
    1: "Alice",
    2: "Bob",
    3: "Charlie",
  };

  // Filtering
  final filtered = users.where((k, v) => k.isEven);
  print(filtered); 
  // {2: Bob}

  final excluded = users.whereNot((k, v) => v.startsWith("A"));
  print(excluded); 
  // {2: Bob, 3: Charlie}

  // Entry queries
  print(users.firstWhere((k, v) => v.contains("a"))); 
  // MapEntry(3: Charlie)

  print(users.firstWhereOrNull((k, v) => v == "Zoe")); 
  // null

  // Key queries
  print(users.firstKeyWhere((k, v) => v.startsWith("B"))); 
  // 2

  // Value queries
  print(users.firstValueWhere((k, v) => k == 1)); 
  // Alice

  print(users.firstValueWhereOrNull((k, v) => v == "Zoe")); 
  // null

  // Transformations
  final upperValues = users.mapValues((v) => v.toUpperCase());
  print(upperValues); 
  // {1: ALICE, 2: BOB, 3: CHARLIE}

  final stringKeys = users.mapKeys((k) => "user_$k");
  print(stringKeys); 
  // {user_1: Alice, user_2: Bob, user_3: Charlie}

  final toList = users.mapToList((k, v) => "$k → $v");
  print(toList); 
  // ["1 → Alice", "2 → Bob", "3 → Charlie"]
}
```

## 🔢 Number Extensions

This extension adds **utility methods** for `double?`, `num?`, and `num`.  
It helps with **null safety, safe divisors, magnitude, and factor rounding**.

---

### ✨ Features

**Nullable double**
- `divisor` → returns the value or `1` if `null`/`0` (avoid division errors)
- `cents` → converts to cents (multiplies by 100, or `0` if null)

**Nullable num**
- `divisor` → same as above, but works with any `num?`

**Non-nullable num**
- `magnitude` → order of magnitude of the number
- `floorToFactor(factor)` → rounds down to nearest multiple of factor

---

### 🧑‍💻 Examples

```dart
import 'package:your_package/your_package.dart';

void main() {
  double? price = 12.5;
  double? zero = 0;
  double? nothing;

  // Safe divisor
  print(price.divisor);   // 12.5
  print(zero.divisor);    // 1
  print(nothing.divisor); // 1

  // Cents conversion
  print(price.cents);     // 1250.0
  print(nothing.cents);   // 0.0

  num? maybeCount = null;
  print(maybeCount.divisor); // 1

  // Magnitude
  print(123.magnitude);   // 1 (10^1 range)
  print(999.magnitude);   // 2 (10^2 range)
  print(0.05.magnitude);  // -1 (less than 1)

  // Floor to factor
  print(123.floorToFactor(10));  // 120.0
  print(87.floorToFactor(25));   // 75.0
}
```

## 🔤 String Extensions

This extension adds **extra utilities** to the `String` class for  
capitalization, numeric formatting, and safe DateTime parsing.

---

### ✨ Features

- `capitalize` → uppercases the first character of the string
- `clearTrailingZeros` → removes unnecessary trailing zeros in numeric strings
- `toLocalDate` → parses a date string into `DateTime` in the local timezone
- `toDateIgnoreTimezone` → parses a date string while **ignoring timezone info**

---

### 🧑‍💻 Examples

```dart
import 'package:your_package/your_package.dart';

void main() {
  // Capitalization
  print("hello".capitalize); // "Hello"

  // Clear trailing zeros
  print("12.3400".clearTrailingZeros); // "12.34"
  print("15.000".clearTrailingZeros);  // "15"

  // Date parsing
  print("2023-08-30T12:34:56Z".toLocalDate); 
  // => 2023-08-30 14:34:56.000 (example, depends on your local timezone)

  print("2023-08-30T12:34:56+02:00".toDateIgnoreTimezone); 
  // => 2023-08-30 12:34:56.000
}
```