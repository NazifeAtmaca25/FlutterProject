class Mesajlar {
  int mesaj_kod;
  String mesaj_icerik;

  Mesajlar(this.mesaj_kod, this.mesaj_icerik);

  factory Mesajlar.fromJson(Map<String, dynamic> json) {
    //factory fromJson: JSON formatındaki veriyi okuyup bir Mesajlar nesnesi oluşturur.
    return Mesajlar(json["mesaj_kod"] as int, json["mesaj_icerik"] as String);
  }
}
