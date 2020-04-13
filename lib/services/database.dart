import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hangman/models/userscore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference highscoreCollection = Firestore.instance.collection('highscore');

  Future updateUserData(String username, int highscore, int rank) async{
    return await highscoreCollection.document(uid).setData({
      'highscore' : highscore,
      'username' : username,
      'rank' : rank,
    });
  }

  // user score list from snapshot
  List<UserScore> _userscorefromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return UserScore(
        username: doc.data['username'] ?? '',
        highscore: doc.data['highscore'] ?? 0,
        rank: doc.data['rank'] ?? null,
      );
    }).toList();
  }

  // get highscore stream
  Stream<List<UserScore>> get scores {
    return highscoreCollection.snapshots()
      .map(_userscorefromSnapshot);
  }
}