import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman/splash.dart';

//import 'game_stage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Splashscreen(),
     );
   }
 }