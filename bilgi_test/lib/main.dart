import 'package:bilgi_test/constants.dart';
import 'package:bilgi_test/test_veri.dart';
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
  TestVeri testVeri = TestVeri();

  void buttonFonksiyonu(bool secilenButon) {
    if (testVeri.testBittiMi()) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Brova Testi Bitirdiniz!!'),
            actions: <Widget>[
              TextButton(
                child: const Text('Başa Dön'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    testVeri.testiSifirla();
                    secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        testVeri.getSoruYaniti() == secilenButon
            ? secimler.add(kDogru)
            : secimler.add(kYanlis);
        testVeri.sonrakiSoru();
      });
    }
  }

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
                    testVeri.getSoruMetni(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ))),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 3,
          runSpacing: 3,
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
                            buttonFonksiyonu(false);
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
                      buttonFonksiyonu(true);
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
