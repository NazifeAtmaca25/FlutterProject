import 'package:bilgi_test/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SoruSayfasi(),
        )),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Bilgi Testi Soruları",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ))),
        Row(
          children: secimler,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              secimler.add(kYanlis);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              backgroundColor: Colors.red),
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                            color: Colors.white,
                          )))),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: ElevatedButton(
                    onPressed: () {
                      secimler.add(kDogru);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.green[400]),
                    child: Icon(
                      Icons.thumb_up,
                      size: 30.0,
                      color: Colors.white,
                    )),
              ))
            ],
          ),
        ))
      ],
    );
  }
}
