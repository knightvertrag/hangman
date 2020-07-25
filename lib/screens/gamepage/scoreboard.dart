//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hangman/models/userscore.dart';
import 'package:hangman/services/database.dart';
import 'package:hangman/widgets/scoretile.dart';
import 'package:provider/provider.dart';
import 'package:hangman/models/user.dart';

class ScorePage extends StatefulWidget {
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //Panel to change username
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('bottom Sheet'),
            );
          });
    }

    final userscores = Provider.of<List<UserScore>>(context) ?? [];
    // userscores.forEach((userscore) {
    //   print(userscore.username);
    //   print(userscore.highscore);
    //   print(userscore.rank);
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text('yolo'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('Settings'))
        ],
      ),
      body: StreamBuilder<List<UserScore>>(
          stream: DatabaseService(uid: user.uid).scores,
          builder: (context, snapshot) {
            List<UserScore> userScore = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: userscores.length,
                itemBuilder: (context, index) {
                  return ScoreTile(userscore: userScore[index]);
                },
              );
            } else {}
          }),
    );
  }
}
