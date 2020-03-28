import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference highscore = Firestore.instance.collection('highscore');

  Future updateUserData(String username, int score) async{
    return await highscore.document(uid).setData({
      'highscore' : score,
      'username' : username,
    });
  }
}