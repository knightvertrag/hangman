import 'package:flutter/material.dart';
import 'package:hangman/enum_collection.dart';
import 'package:hangman/gamebloc.dart';

class VertHangManPainter extends CustomPainter {
  final GameStageBloc _gameStageBloc;

  double _headHeight = 16.0;

  VertHangManPainter(this._gameStageBloc);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.grey;
    paint.style = PaintingStyle.fill;
    
    _drawNoose(canvas, size, paint);

    if(_gameStageBloc.lostParts.value.contains(BodyPart.head)) {
      _drawHead(canvas, size, paint);
    }

    if(_gameStageBloc.lostParts.value.contains(BodyPart.body)) {
      _drawBody(canvas, size, paint);
    }

    if(_gameStageBloc.lostParts.value.contains(BodyPart.leftLeg)) {
      _drawLeg(canvas, size, paint, Limb.left);
    }

    if(_gameStageBloc.lostParts.value.contains(BodyPart.rightLeg)) {
      _drawLeg(canvas, size, paint, Limb.right);
    }

    if(_gameStageBloc.lostParts.value.contains(BodyPart.leftHand)) {
      _drawHand(canvas, size, paint, Limb.left);
    }

    if(_gameStageBloc.lostParts.value.contains(BodyPart.rightHand)) {
      _drawHand(canvas, size, paint, Limb.right);
    }
  }

  _drawNoose(Canvas canvas, Size size, Paint paint) {
    var nooseStart = Offset(size.width/2, 0);
    var nooseEnd = Offset(size.width/2, size.height/5);
    paint.strokeWidth = 4.0;
    canvas.drawLine(nooseStart, nooseEnd, paint);
  }

  _drawHead(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.blueGrey;  
    paint.style = PaintingStyle.fill;
    var nooseEnd = Offset(size.width/2, size.height/5);
    canvas.drawCircle(nooseEnd, _headHeight, paint);

    //add the neck
    paint.color = Colors.red;
    var neckStart = Offset(size.width/2, size.height/5 + _headHeight);
    var neckEnd = Offset(size.width/2, size.height/5 + _headHeight + _headHeight/3);
    paint.strokeWidth = 6.0;
    canvas.drawLine(neckStart, neckEnd, paint);
  }

  _drawBody(Canvas canvas, Size size, Paint paint) {
    
    paint.color = Colors.blueGrey;
    var neckEnd = Offset(size.width/2, size.height/5 + _headHeight + _headHeight/3);
    var bodyEnd = Offset(size.width/2, neckEnd.dy + (3 * _headHeight));

    paint.strokeWidth = 2.0;
    paint.style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromCenter(
      center: Offset(size.width/2, (neckEnd.dy + bodyEnd.dy)/2),height: _headHeight * 3, width: _headHeight * 2), paint);
  }

  _drawLeg(Canvas canvas, Size size, Paint paint, Limb limb) {
    paint.color = Colors.blueGrey;
    var neckEnd = Offset(size.width/2, size.height/5 + _headHeight + _headHeight/3);

    var dxStart = limb == Limb.left ? size.width/2 - 16 : size.width/2 + 16;
    var legStart = Offset(dxStart, neckEnd.dy + (3 * _headHeight));

    var dxEnd = limb == Limb.left ? size.width/2 - 32 : size.width/2 + 32;
    var legEnd = Offset(dxEnd, legStart.dy + (3 * _headHeight));
    paint.strokeWidth = 2.0;
    canvas.drawLine(legStart, legEnd, paint);
  }

  _drawHand(Canvas canvas, Size size, Paint paint, Limb limb) {
    var neckEnd = Offset(size.width/2, size.height/5 + _headHeight + _headHeight/3);

    var dxStart = limb == Limb.left ? size.width/2 - 16 : size.width/2 + 16;
    var handStart = Offset(dxStart, neckEnd.dy);

    var dx = limb == Limb.left ? size.width/2 - 32 : size.width/2 + 32;

    var handEnd = Offset(dx, handStart.dy + (3 * _headHeight));
    canvas.drawLine(handStart, handEnd, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {    
    return false;
  }  
}