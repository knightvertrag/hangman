import 'dart:math';

class GuessWordHelper {
  var _words = [
    "schizophrenia",
    "fox",
    "jacket",
    "masquerade",
    "geography",
    "cat",
    "yesterday",
    "java",
    "truck",
    "opportunity",
    "fish",
    "token",
    "transportation",
    "bottom",
    "apple",
    "cake",
    "remote",
    "boots",
    "terminology",
    "arm",
    "cranberry",
    "tool",
    "caterpillar",
    "spoon",
    "watermelon",
    "laptop",
    "toe",
    "toad",
    "fundamental",
    "capitol",
    "garbage",
    "anticipate",
    "pesky",
  ];

  String generateRandomWord() {
    var randomGenerator = Random();
    var randomIndex = randomGenerator.nextInt(_words.length);
    //print(_words);
    return _words[randomIndex].toUpperCase();
  }
}
