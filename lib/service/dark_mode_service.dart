import 'package:flutter/material.dart';

class DarkModeService extends ChangeNotifier {
  bool _darkMode = false;

bool get darkMode => _darkMode;
  set darkMode (bool value) {
    _darkMode = value;
    notifyListeners();
    //Pra funcionar o change Notifier que avisa pra todo mundo
    // Todo mundo que está escutando 
    //é necessário colocar essa função notifyListeners(); no set
    //e ir no my_app e colocar o MaterialApp dentro de um 
    // MultiProvider()
  }
}
