import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/VeritabaniYardimcisi.dart';

class Kisilerdao {
  Future<List<Kisiler>> tumKisiler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT*FROM kisiler");
    /*rawQuery: Bu, SQLite veritabanında bir SQL sorgusu çalıştırmak için kullanılan bir fonksiyondur.
    rawQuery doğrudan SQL sorgusu çalıştırmanıza olanak tanır.*/

    return List.generate(maps.length, (i) {
      /*List.generate(maps.length, (i) {...}): Bu, veritabanından alınan
      verileri dönüştürmek için kullanılan bir Dart fonksiyonudur.*/
      var satir = maps[i];
      return Kisiler(satir["kisi_id"], satir["kisi_adi"], satir["kisi_yasi"]);
    });
  }

  Future<void> kisiEkle(String kisi_adi, int kisi_yasi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_adi"] = kisi_adi;
    bilgiler["kisi_yasi"] = kisi_yasi;

    await db.insert("kisiler", bilgiler);
  }

  Future<void> kisiSil(int kisi_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();
    await db.delete("kisiler", where: "kisi_id=?", whereArgs: [kisi_id]);
  }

  Future<void> kisiGuncelle(int kisi_id, String kisi_adi, int kisi_yasi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_adi"] = kisi_adi;
    bilgiler["kisi_yasi"] = kisi_yasi;

    await db
        .update("kisiler", bilgiler, where: "kisi_id=?", whereArgs: [kisi_id]);
  }

  Future<int> kayitKontrol(String kisi_adi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT count(*) AS sonuc FROM kisiler Where kisi_adi=?", [kisi_adi]);
    return maps[0]["sonuc"];
  }
}
