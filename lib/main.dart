import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman/screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:hangman/services/auth.dart';
import 'package:hangman/models/user.dart';

//import 'game_stage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Hangman",
        home: Splashscreen(),
      ),
    );
  }
}
