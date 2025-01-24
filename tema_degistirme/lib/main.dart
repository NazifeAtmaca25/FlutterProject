import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme_data.dart';

//Buradaki provider saysinde themedattaki temaları rahatlıkla kullanabiliyoruz.
void main() async {
  //Bu kısmı bu şekilde yaparak ilk başlattığımızda yükleme ekranı en son ne yaptıysak o yüklenecek
  //ayrıca uygulamamnın ilk hali ısa sürede olsa gözürüküyordu o belli olmuyor bu sayede
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeDataColor().creatSharedPreference();
  runApp(ChangeNotifierProvider<ThemeDataColor>(
      create: (BuildContext context) => ThemeDataColor(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeDataColor>(context, listen: false)
        .loadThemetoSharedPreference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeDataColor>(context).themeColor,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Tema Seçimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Text(Provider.of<ThemeDataColor>(context).isGreen
                  ? "Yeşil Tema"
                  : "Kırmızı Tema"),
              onChanged: (_) {
                //herhangi bir input koymak istemezsek _ koymak yeterli
                //burada yapılan değişiklik ekrana yansıltılması için listen false yapıldı
                Provider.of<ThemeDataColor>(context, listen: false)
                    .toggleTheme();
              },
              value: Provider.of<ThemeDataColor>(context).isGreen,
            ),
            Card(
              child: ListTile(
                title: Text("Yapılacaklar"),
                trailing: Icon(Icons.check_box),
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text("Ekle"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
