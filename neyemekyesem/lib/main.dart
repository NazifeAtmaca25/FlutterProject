import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bugün Ne Yesem?",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corba_no = 1;
  int yemek_no = 1;
  int tatli_no = 1;

  void yemekleriYenile() {
    setState(() {
      corba_no = Random().nextInt(5) + 1;
      yemek_no = Random().nextInt(5) + 1;
      tatli_no = Random().nextInt(5) + 1;
    });
  }

  List<String> corbaAdlari = [
    "Mercimek çorbası",
    "Tarhana çorbası",
    "Tavuksuyu çorbası",
    "Düğün çorbası",
    "Yoğurtlu çorba"
  ];
  List<String> yemekAdlari = [
    "Karnıyarık",
    "Mantı",
    "Kuru Faulye",
    "İçli Köfte",
    "Izgara Balık"
  ];
  List<String> tatliAdlari = [
    "Kadayıf",
    "Baklava",
    "Sütlaç",
    "Kazandibi",
    "Dondurma"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: yemekleriYenile,
                child: Image.asset('assets/corba_$corba_no.jpg'),
              ),
            ),
          ),
          Text(
            corbaAdlari[corba_no - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 200,
              child: Divider(
                height: 5,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/yemek_$yemek_no.jpg')),
            ),
          ),
          Text(
            yemekAdlari[yemek_no - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 200,
              child: Divider(
                height: 5,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/tatli_$tatli_no.jpg')),
            ),
          ),
          Text(
            tatliAdlari[tatli_no - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 200,
              child: Divider(
                height: 5,
              )),
        ],
      ),
    );
  }
}
