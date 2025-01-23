import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TurkBayragi(200),
    );
  }
}

class TurkBayragi extends StatelessWidget {
  final double g;
  TurkBayragi(this.g);

  @override
  Widget build(BuildContext context) {
    Widget kirmiziKutu = Container(
      width: g * 1.5,
      height: g,
      color: Colors.red,
    );
    Widget daire = Container(
      child: Icon(
        Icons.circle,
        size: 0.5 * g,
        color: Colors.white,
      ),
    );
    Widget miniDaire = Container(
      child: Icon(
        Icons.circle,
        size: 0.4 * g,
        color: Colors.red,
      ),
    );
    Widget star = Container(
      child: Icon(
        Icons.star,
        size: 0.25 * g,
        color: Colors.white,
      ),
    );
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            kirmiziKutu,
            Positioned(top: 0.25 * g, left: 0.25 * g, child: daire),
            Positioned(top: 0.3 * g, left: 0.3625 * g, child: miniDaire),
            Positioned(
                left: 0.7 * g,
                top: 0.375 * g,
                child: RotatedBox(quarterTurns: -1, child: star))
          ],
        ),
      ),
    );
  }
}
