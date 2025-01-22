import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyGengerColumn extends StatelessWidget {
  final String? genger;
  final IconData? icon;

  MyGengerColumn({this.genger = "default", this.icon = FontAwesomeIcons.f});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için
      children: [
        Icon(
          icon,
          size: 50.0, // İkonun boyutunu belirleyebilirsiniz
          color: Colors.black54, // İkon rengi
        ),
        Text(
          genger!,
          style: TextStyle(
              fontSize: 30, color: Colors.black54, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Widget? child;
  final Color? renk;
  final void Function()? onpress; //Bu kısımlar önemliii
  MyContainer(
      {this.onpress,
      this.renk = Colors.white,
      this.child}); // Constructor ile parametre alımı
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
        child: child, // Burada child ekleniyor
      ),
    );
  }
}

TextStyle kMetinStili =
    TextStyle(fontSize: 25, color: Colors.black54, fontWeight: FontWeight.bold);
