import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hangman/models/user.dart';

import 'package:hangman/screens/gamepage/game_stage.dart';
import 'package:hangman/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //returns either gamescreen or auth depending on login status.
    if (user == null) {
      return Authenticate();
    } else {
      return VerticalGameStage();
    }
  }
}
