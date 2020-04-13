import 'package:flutter/material.dart';
import 'package:hangman/models/userscore.dart';

class ScoreTile extends StatelessWidget {
  final UserScore userscore;
  ScoreTile({this.userscore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('assets/nooseavatar.jpg'),
          ),
          title: Text('${userscore.rank}.${userscore.username}   highscore = ${userscore.highscore}'),
        ),
      ),
    );
  }
}
