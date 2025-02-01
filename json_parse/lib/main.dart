import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse/Mesajlar.dart';

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

  @override
  void initState() {
    super.initState();
    mesajParse();
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
