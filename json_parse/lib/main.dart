import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse/FilmlerCevap.dart';
import 'package:json_parse/Kisiler.dart';
import 'package:json_parse/KisilerCevap.dart';
import 'package:json_parse/Mesajlar.dart';

import 'Filmler.dart';

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
  void mesajParse() {
    //tek bir nesne için
    String strVeri =
        '{ "mesajlar" : {"mesaj_kod" : 1,"mesaj_icerik" : "başarılı" } }';
    var jsonVeri = json.decode(
        strVeri); //string olarak gelen JSON verisini Dart'ın anlayabileceği bir Map yapısına çeviriyor.
    var jsonNesne = jsonVeri["mesajlar"];
    var mesaj = Mesajlar.fromJson(jsonNesne);

    print("Mesaj kodu: ${mesaj.mesaj_kod}");
    print("Mesaj içerik: ${mesaj.mesaj_icerik}");
  }

  void kisilerParse() {
    //tek array
    String strVeri =
        '{"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"123123"},{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"987987"}]}';
    var jsonVeri =
        json.decode(strVeri); //string veriyi json yapısına dönüştürür.
    var jsonArray = jsonVeri["kisiler"]
        as List; /*json veri içindeki parse etmek istediğimiz
     alanı alabilmek içinismi ile erişiyoruz.*/
    List<Kisiler> kisilerListesi = jsonArray
        .map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi))
        .toList();
    /*Json içindeki array Kisiler nesnelerine dönüştürüp liste haline getirme
      jsonArrayNesnesi: {"kisi_id":"1","kisi_ad":"ahmet","kisi_tel":"123123"}
      Listenin içindeki her bir nesneyi temsil eder.*/

    for (var k in kisilerListesi) {
      print("-----------------------------");
      print("Kisi id: ${k.kisi_id}");
      print("Kisi id: ${k.kisi_ad}");
      print("Kisi id: ${k.kisi_tel}");
    }
  }

  void kisilerCevapParse() {
    //karışık veri
    String strVeri =
        '{"success":1,"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"123123"},{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"987987"}]}';
    var jsonVeri = json.decode(strVeri);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    print("Success: ${kisilerCevap.success}");

    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;

    for (var k in kisilerListesi) {
      print("-----------------------------");
      print("Kisi id: ${k.kisi_id}");
      print("Kisi id: ${k.kisi_ad}");
      print("Kisi id: ${k.kisi_tel}");
    }
  }

  void filmlerCevapParse() {
    //Karışık veri (Foreign key)
    String srtVeri =
        '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
        ',"film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Nolan"}},'
        '{"film_id":"3","film_ad":"The Pianist"'
        ',"film_yil":"2002","film_resim":"pianist.png",'
        '"kategori":{"kategori_id":"3","kategori_ad":"dram"},'
        '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Polanski"}}]}';

    var jsonVeri = json.decode(srtVeri);
    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);
    int success = filmlerCevap.success;

    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;

    print("Success: $success");
    for (var f in filmlerListesi) {
      print("-----------------------------");
      print("Film id: ${f.film_id}");
      print("Film ad: ${f.film_ad}");
      print("Film yıl: ${f.film_yil}");
      print("Film resim: ${f.film_resim}");
      print("Film kategori: ${f.kategori.kategori_ad}");
      print("Film yonetmen: ${f.yonetmen.yonetmen_ad}");
    }
  }

  @override
  void initState() {
    super.initState();
    //mesajParse();
    //kisilerParse();
    //kisilerCevapParse();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("JSON Parse"),
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
