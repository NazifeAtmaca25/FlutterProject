import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "rehber.sqlite";

  static Future<Database> veritabaniErisimi() async {
    //Flutter ile SQLite kullanırken hazır bir veritabanı dosyasını (rehber.sqlite) cihaza kopyalayıp kullanmayı amaçlıyor.
    String veritabaiYolu = join(await getDatabasesPath(), veritabaniAdi);
    if (await databaseExists(veritabaiYolu)) {
      //veritabaniYolu'nda bir SQLite dosyası olup olmadığını kontrol eder.
      print("Veritabanı zaten var. Kopyalamaya gerek yok");
    } else {
      var data = await rootBundle.load(
          "database/$veritabaniAdi"); //Uygulamanın assets klasöründeki veritabanı dosyasını belleğe yükler.
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      /*Belleğe yüklenen verileri bir byte dizisine (List<int>) dönüştürür.
SQLite dosyası ikili (binary) formatta olduğu için doğrudan bir dosya olarak kullanamayız,
 bu yüzden byte dizisine çevirmemiz gerekir.*/
      await File(veritabaiYolu).writeAsBytes(bytes, flush: true);
      /*.writeAsBytes(bytes, flush: true)
Byte dizisini dosya olarak kaydeder.
flush: true → Yazma işlemi bittiğinde verileri hemen diske yazmasını sağlar. (Bazı sistemlerde bu işlem gecikebilir, flush ile bu engellenir.)
*/
      print("Veritabanı kopyalandı");
    }
    return openDatabase(
        veritabaiYolu); // SQLite veritabanını açar ve kullanıma hazır hale getirir
  }
}
