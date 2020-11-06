import 'package:random_words/random_words.dart';

class GuessWordHelper {
  String generateRandomWord() {
    return WordNoun.random(maxSyllables: 5).toString().toUpperCase();
  }
}
