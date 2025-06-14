import 'package:flutter/material.dart';

class ContadorService extends ChangeNotifier {
  int _contador = 0;

  int get contador => _contador;
  void incrementar () {
    _contador = _contador + 1;
    notifyListeners();
  }
  void decrementar () {
    _contador = _contador - 1;
    notifyListeners();
  }
}