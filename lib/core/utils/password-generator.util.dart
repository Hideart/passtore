import 'dart:math';

class Password {
  static List<String> _fillCharacters(
    List<String> arr,
    int availableCharactersCount,
  ) {
    List<String> filled = [];
    const int upperCaseChance = 30;

    for (int i = 0; i < availableCharactersCount; i++) {
      final bool isUpperCase =
          1 + new Random().nextInt(99 - 1) <= upperCaseChance;
      final int charIndex = new Random().nextInt(arr.length - 1);
      filled.add(isUpperCase ? arr[charIndex].toUpperCase() : arr[charIndex]);
    }
    return filled;
  }

  static String generate({
    int passLength = 16,
    double specialsChance = 0.2,
    double numsChance = 0.2,
  }) {
    const List<String> specials = ['@', '!', '*', '\$', '%', '&', '^'];
    var aCode = 'a'.codeUnitAt(0);
    var zCode = 'z'.codeUnitAt(0);
    List<String> letters = List<String>.generate(
      zCode - aCode + 1,
      (index) => String.fromCharCode(aCode + index),
    );
    List<String> nums = List<String>.generate(
      10,
      (index) => index.toString(),
    );

    final int specialsCount = (passLength * specialsChance).round();
    final int numsCount = (passLength * numsChance).round();

    final List<String> filledSpecials = Password._fillCharacters(
      specials,
      specialsCount,
    );
    final List<String> filledNums = Password._fillCharacters(nums, numsCount);
    final List<String> filledLetters = Password._fillCharacters(
      letters,
      passLength - specialsCount - numsCount,
    );

    final List<String> password = [
      ...filledLetters,
      ...filledSpecials,
      ...filledNums
    ]..shuffle();
    return password.join();
  }
}
