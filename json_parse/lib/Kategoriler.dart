class Kategoriler {
  String katergori_id;
  String kategori_ad;

  Kategoriler(this.katergori_id, this.kategori_ad);

  factory Kategoriler.fromJson(Map<String, dynamic> json) {
    return Kategoriler(
        json["kategori_id"] as String, json["kategori_ad"] as String);
  }
}
