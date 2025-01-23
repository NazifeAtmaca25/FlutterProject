import 'package:flutter/material.dart';
import 'package:life_expectancy/hesaplama.dart';
import 'package:life_expectancy/user_data.dart';
import 'package:life_expectancy/widgets.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                "Beklenen Yaşam Süresi:${Hesaplama(_userData).hesap().round().toString()}",
                style: kMetinStili,
              ))),
          Expanded(
              flex: 1,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Geri Dön",
                    style: kMetinStili,
                  )))
        ],
      ),
    );
  }
}
