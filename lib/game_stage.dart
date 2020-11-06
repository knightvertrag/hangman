import 'package:flutter/material.dart';
import 'package:hangman/enum_collection.dart';
import 'package:hangman/gamebloc.dart';
import 'package:hangman/puzzle.dart';
import 'package:hangman/hangman_painter.dart';

import 'character_picker.dart';

class VerticalGameStage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerticalGameStage();
  }
}

class _VerticalGameStage extends State<VerticalGameStage> {
  GameStageBloc _gameStageBloc;

  @override
  void initState() {
    super.initState();
    _gameStageBloc = GameStageBloc();
  }

  @override
  void dispose() {
    _gameStageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQd = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: EdgeInsets.all(24.0),
        width: mediaQd.width,
        height: mediaQd.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHangManPainter(),
            Divider(
              color: Colors.grey[600],
              height: 2.0,
            ),
            Expanded(child: _buildMainSection())
          ],
        ),
      ),
    );
  }

  Widget _buildHangManIntro() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'HANGMAN',
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
          ),
        ),
        RaisedButton(
          child: Text(
            'New Game',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 30.0,
            ),
          ),
          onPressed: () {
            _gameStageBloc.createNewGame();
          },
        )
      ],
    );
  }

  //ignore: missing_return
  Widget _buildGameEndScreen(GameState gameState) {
    if (gameState == GameState.succeeded) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Well done! You got the right answer.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          RaisedButton(
            child: Text('New Game'),
            onPressed: () {
              _gameStageBloc.createNewGame();
            },
          )
        ],
      );
    }

    if (gameState == GameState.failed) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Oops you failed!',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            'The correct word was:',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 24.0,
            ),
          ),
          Text(
            _gameStageBloc.curGuessWord.value,
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          RaisedButton(
            child: Text('New Game'),
            onPressed: () {
              _gameStageBloc.createNewGame();
            },
          )
        ],
      );
    }
  }

  Widget _buildGamePlayGround(String guessWord) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Guess the correct word',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18.0,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.restore,
                color: Colors.grey[350],
                size: 24.0,
              ),
              onPressed: () {
                _gameStageBloc.createNewGame();
              },
            ),
          ],
        ),
        Puzzle(
          guessWord: guessWord,
          gameStageBloc: _gameStageBloc,
        ),
        CharacterPicker(
          gameStageBloc: _gameStageBloc,
        ),
      ],
    );
  }

  Widget _buildMainSection() {
    return ValueListenableBuilder(
      valueListenable: _gameStageBloc.curGuessWord,
      builder: (BuildContext ctxt, String guessWord, Widget child) {
        if (guessWord == null || guessWord == '') {
          return _buildHangManIntro();
        }
        return ValueListenableBuilder(
          valueListenable: _gameStageBloc.curGameState,
          builder: (BuildContext ctxt, GameState gameState, Widget child) {
            if (gameState == GameState.succeeded ||
                gameState == GameState.failed) {
              return _buildGameEndScreen(gameState);
            }

            return _buildGamePlayGround(guessWord);
          },
        );
      },
    );
  }

  Widget _buildHangManPainter() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 8.0),
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.all(32.0),
      child: Center(
        child: CustomPaint(
          painter: VertHangManPainter(_gameStageBloc),
          size: Size(
            double.infinity,
            double.infinity,
          ),
        ),
      ),
    );
  }
}
