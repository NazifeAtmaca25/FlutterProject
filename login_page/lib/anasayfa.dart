import 'package:flutter/material.dart';
import 'package:login_page/main.dart'; // Login sayfasına geri dönebilmek için
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String? spKullaniciAdi;
  String? spSifre;

  Future<void> oturumBilgisi() async {
    var sp = await SharedPreferences.getInstance();
    setState(() {
      spKullaniciAdi = sp.getString("kullaniciAdi") ?? "Bilinmiyor";
      spSifre = sp.getString("sifre") ?? "Bilinmiyor";
    });
  }

  Future<void> cikisYap() async {
    var sp = await SharedPreferences.getInstance();
    await sp.clear(); // 🔹 Kullanıcı bilgilerini siliyoruz

    // 🔹 Giriş sayfasına geri dönüyoruz
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    oturumBilgisi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: cikisYap, // 🔹 Çıkış yap fonksiyonunu çağırıyoruz
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kullanıcı adı: $spKullaniciAdi"),
            Text("Şifre: $spSifre"),
          ],
        ),
      ),
    );
  }
}
