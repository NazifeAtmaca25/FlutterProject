import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var flp =
      FlutterLocalNotificationsPlugin(); //Bu nesne bildirimleri yönetmek için kullanılır.

  Future<void> kurulum() async {
    var androidAyari = const AndroidInitializationSettings(
        "@mipmap/ic_launcher"); //Android tarafındaki bildirimlerin nasıl çalışacağını belirler.
    var iosAyari = const DarwinInitializationSettings();
    var kurulumAyari =
        InitializationSettings(android: androidAyari, iOS: iosAyari);
    await flp.initialize(kurulumAyari,
        onDidReceiveBackgroundNotificationResponse: bildirimSecilme);
    //onDidReceiveBackgroundNotificationResponse, arka planda bir bildirime tıklandığında çalıştırılacak fonksiyonu belirler. Burada bildirimSecilme fonksiyonu atanmıştır.
  }

  Future<void> bildirimSecilme(NotificationResponse notificatinResponse) async {
    //kullanıcı bir bildirime tıkladığında çalışır ve bildirimin yükünü (payload) yazdırır.
    var payload = notificatinResponse
        .payload; // NotificationResponse nesnesinden bildirimin içeriğini (payload) alır.
    if (payload != null) {
      print("Bildirim seçildi: $payload");
    }
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }

  Future<void> bildirimGoster() async {
    var androidBildirimDetay = const AndroidNotificationDetails(
      "kanal id",
      "kanal başlık",
      channelDescription: "kanal açıklama",
      priority: Priority.high,
      importance: Importance.max,
      icon: '@mipmap/ic_launcher',
    );
    var iosBildirimDetay = const DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(
        android: androidBildirimDetay, iOS: iosBildirimDetay);
    await flp.show(0, "Başlık", "İçerik", bildirimDetay,
        payload: "Payload İçerik");
  }

  Future<void> bildirimGecikmeliGoster() async {
    var androidBildirimDetay = const AndroidNotificationDetails(
      "kanal id",
      "kanal başlık",
      channelDescription: "kanal açıklama",
      priority: Priority.high,
      importance: Importance.max,
      icon: '@mipmap/ic_launcher',
    );
    var iosBildirimDetay = const DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(
        android: androidBildirimDetay, iOS: iosBildirimDetay);
    tz.initializeTimeZones();
    var gecikme = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

    await flp.zonedSchedule(
        0, "Başlık Gecikmeli", "İçerik Gecikmeli", gecikme, bildirimDetay,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
        payload: "Payload");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Bildirim kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                bildirimGoster();
              },
              child: Text("Bildirim Oluştur"),
            ),
            ElevatedButton(
                onPressed: () {
                  bildirimGecikmeliGoster();
                },
                child: Text("Bildirim Oluştur (Gecikmeli)"))
          ],
        ),
      ),
    );
  }
}
