import 'package:flutter/material.dart';
import 'package:login_page/anasayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: LoginPage(),
    );
  }
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  Future<void> girisKontrol(BuildContext context) async {
    var ka = tfKullaniciAdi.text;
    var s = tfSifre.text;

    if (ka == "admin" && s == "1234") {
      var sp = await SharedPreferences.getInstance();
      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", s);
      if (context.mounted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Anasayfa()));
      }
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Hatalı Giriş"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tfKullaniciAdi,
              decoration: InputDecoration(hintText: "Kullanıcı Adı"),
            ),
            TextField(
              obscureText: true,
              controller: tfSifre,
              decoration: InputDecoration(hintText: "Şifre"),
            ),
            ElevatedButton(
                onPressed: () {
                  girisKontrol(context);
                },
                child: Text("Giriş Yap"))
          ],
        ),
      )),
    );
  }
}
