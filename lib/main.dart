import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Learn',
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  Widget bodyPart(
      {double height, double width, topLeft, topRight, bottomLeft, bottomRight,child}
      ) {
    return Container(
      width: width == null ? 200 : width,
      height: height,
      child: child==null?null:child,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topLeft: topLeft == null ? Radius.circular(0) : topLeft,
              topRight: topRight == null ? Radius.circular(0) : topRight,
              bottomLeft: bottomLeft == null ? Radius.circular(0) : bottomLeft,
              bottomRight:
              bottomRight == null ? Radius.circular(0) : bottomRight)),
    );
  }
  Widget head(){
    return bodyPart(
        height: 100,
        topLeft: Radius.circular(100),
        topRight: Radius.circular(100),
      child: Container(
        padding: EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(backgroundColor: Colors.white,radius: 10,),
            CircleAvatar(backgroundColor: Colors.white, radius: 10,)
          ],
        ),
      )
    );
}
  Widget completeHead(){
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RotationTransition(
                turns: AlwaysStoppedAnimation(140 / 360), child: antenna(),
              ),
              RotationTransition(
                turns: AlwaysStoppedAnimation(40 / 360), child: antenna(),
              ),
            ],
          ),
        ),
        head(),
      ],
    );
  }
  Widget hands() {
    return bodyPart(
        width: 40,
        height: 180,
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20));
  }
  Widget legs() {
    return bodyPart(
        width: 40,
        height: 100,
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20));
  }
  Widget antenna() {
    return bodyPart(
        width: 10,
        height: 120,
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            completeHead(),
            Row( // body
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                hands(),
                SizedBox(width: 10),
                bodyPart(
                    height: 200,
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                SizedBox(width: 10),
                hands(),
              ],
            ),
            Container( // legs
              width: 165,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  legs(),
                  legs(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
