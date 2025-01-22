import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/widgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String cinsiyetSecimi = "";
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            "Boy",
                            style: kMetinStili,
                          )),
                      RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            boy.toString(),
                            style: kMetinStili,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                boy++;
                              });
                            },
                            child: Text(
                              "+",
                              style: kMetinStili,
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.blue)),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                boy--;
                              });
                            },
                            child: Text(
                              "-",
                              style: kMetinStili,
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.blue)),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: MyContainer()),
              ],
            ),
          ),
          Expanded(
              child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Haftada kaç gün spor yapıyorsunuz?", style: kMetinStili),
                Text(yapilanSpor.round().toString(), style: kMetinStili),
                Slider(
                  activeColor: Colors.blue,
                  value: yapilanSpor,
                  onChanged: (double newValue) {
                    setState(() {
                      yapilanSpor = newValue;
                    });
                  },
                  min: 0,
                  max: 7,
                )
              ],
            ),
          )),
          Expanded(
              child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Günde kaç sigara içiyorsunuz?", style: kMetinStili),
                Text(icilenSigara.round().toString(), style: kMetinStili),
                Slider(
                  activeColor: Colors.blue,
                  min: 0,
                  max: 30,
                  value: icilenSigara,
                  onChanged: (double newValue) {
                    setState(() {
                      icilenSigara = newValue;
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onpress: () {
                      setState(() {
                        cinsiyetSecimi = "Kadın";
                      });
                    },
                    renk: cinsiyetSecimi == "Kadın"
                        ? Colors.pink[100]
                        : Colors.white,
                    child: MyGengerColumn(
                      genger: "Kadın",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                    child: MyContainer(
                  onpress: () {
                    setState(() {
                      cinsiyetSecimi = "Erkek";
                    });
                  },
                  renk: cinsiyetSecimi == "Erkek"
                      ? Colors.lightBlue[100]
                      : Colors.white,
                  child: MyGengerColumn(
                    genger: "Erkek",
                    icon: FontAwesomeIcons.mars,
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
