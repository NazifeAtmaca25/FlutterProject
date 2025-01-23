import 'package:life_expectancy/user_data.dart';

class Hesaplama {
  UserData _userData;
  Hesaplama(this._userData);

  double hesap() {
    double sonuc;
    sonuc = 90 + _userData.yapilanSpor - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    if (_userData.cinsiyetSecimi == "Kadın") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
