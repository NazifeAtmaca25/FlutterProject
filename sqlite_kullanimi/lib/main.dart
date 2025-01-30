import 'package:flutter/material.dart';
import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/Kisilerdao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  Future<void> kisileriGoster() async {
    var liste = await Kisilerdao().tumKisiler();
    for (Kisiler k in liste) {
      print("********************");
      print("Kisi id: ${k.kisi_id}");
      print("Kisi adı: ${k.kisi_adi}");
      print("Kisi yaiı: ${k.kisi_yasi}");
    }
  }

  Future<void> ekle() async {
    await Kisilerdao().kisiEkle("Murat", 40);
  }

  Future<void> sil() async {
    await Kisilerdao().kisiSil(2);
  }

  Future<void> guncelle() async {
    await Kisilerdao().kisiGuncelle(4, "Yeni Sena", 30);
  }

  Future<void> kayitKontrol() async {
    int sonuc = await Kisilerdao().kayitKontrol("Nazife");
    print("Veritabaındaki seçili isim sayısı: $sonuc");
  }

  @override
  void initState() {
    super.initState();
    //ekle();
    //sil();
    //guncelle();
    kayitKontrol();
    kisileriGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
