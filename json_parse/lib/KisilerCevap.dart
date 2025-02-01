import 'package:json_parse/Kisiler.dart';

class KisilerCevap {
  int success;
  List<Kisiler> kisilerListesi;

  KisilerCevap(this.success, this.kisilerListesi);

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
    /*Dışarıdan gelen json veri içinden kisiler  arrayi alıyoruz ve listeye dönüştürüyoruz.
    * Aslında burada parse işlemi yapıyoruz fakat bu parse işlemi array içindeki nesneleri almak için*/
    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisilerListesi = jsonArray
        .map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi))
        .toList();

    return KisilerCevap(json["success"] as int, kisilerListesi);
  }
}
