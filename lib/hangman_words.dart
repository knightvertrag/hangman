import 'dart:math';

import 'package:flutter/services.dart';


class GuessWordHelper {
  List<String> _words = [];
  Future readWords() async {
    String fileText = await rootBundle.loadString('assets/hangman_words.txt');
    _words = fileText.split('\n');
  }


  String generateRandomWord() {

    var randomGenerator = Random();
    var randomIndex = randomGenerator.nextInt(_words.length);
    print(_words);
    return _words[randomIndex].toUpperCase();
  }
}

