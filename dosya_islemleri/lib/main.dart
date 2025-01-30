import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tfGirdi = TextEditingController();

  Future<void> dosyaHazirla() async {}

  Future<void> veriYaz() async {
    var ad =
        await getApplicationDocumentsDirectory(); //bunun sayesinde dosya sistemine erişim sağlanır

    var uygulamaDosyaYolu = await ad
        .path; // uygulamada dosyalama nerede yapıcaksak onu göstermiş oluyoruz.

    var dosya = File("$uygulamaDosyaYolu/dosyam.txt");
    dosya.writeAsString(
        tfGirdi.text); //girilen değeri bunun sayesimde dosyama yazıyoruz.

    tfGirdi.text = "";
  }

  Future<void> veriOku() async {
    try {
      var ad =
          await getApplicationDocumentsDirectory(); //bunun sayesinde dosya sistemine erişim sağlanır

      var uygulamaDosyaYolu = await ad
          .path; // uygulamada dosyalama nerede yapıcaksak onu göstermiş oluyoruz.

      var dosya = File("$uygulamaDosyaYolu/dosyam.txt");
      String okunanVeri = await dosya.readAsString();
      tfGirdi.text = okunanVeri;
    } catch (e) {
      e.toString();
    }
  }

  Future<void> veriSil() async {
    var ad =
        await getApplicationDocumentsDirectory(); //bunun sayesinde dosya sistemine erişim sağlanır

    var uygulamaDosyaYolu = await ad
        .path; // uygulamada dosyalama nerede yapıcaksak onu göstermiş oluyoruz.

    var dosya = File("$uygulamaDosyaYolu/dosyam.txt");
    if (dosya.existsSync()) //dosya var mı yok mu onu kontrol ediyor
    {
      dosya.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfGirdi,
                decoration: InputDecoration(hintText: "Veri giriniz..."),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      veriYaz();
                    },
                    child: Text("Yaz")),
                ElevatedButton(
                    onPressed: () {
                      veriOku();
                    },
                    child: Text("Oku")),
                ElevatedButton(
                    onPressed: () {
                      veriSil();
                    },
                    child: Text("Sil"))
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
