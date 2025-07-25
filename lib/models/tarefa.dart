import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao;
  bool _concluido;

  Tarefa(String descricao, bool concluido)
      : _descricao = descricao,
        _concluido = concluido;

  String get id => _id;
  String get descricao => _descricao;
  bool get concluido => _concluido;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  set concluido(bool concluido) {
    _concluido = concluido;
  }
}
