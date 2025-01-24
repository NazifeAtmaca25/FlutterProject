import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier {
  String sehir = 'Denizli';

  void newCity(String city) {
    sehir = city;
    notifyListeners(); //değişiklik oldupunda bildirim göndericek
  }
}
