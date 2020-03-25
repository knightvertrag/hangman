import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hangman/wrapper.dart';

//import 'game_stage.dart';


class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Wrapper(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Hangman",
          style: TextStyle(
              fontSize: 50.0, fontFamily: 'Satisfy', color: Colors.white),
        ),
      ),
    );
  }
}
