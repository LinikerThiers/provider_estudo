import 'package:flutter/material.dart';
import 'package:provider_app/models/tarefa.dart';

class TarefaRepository extends ChangeNotifier {
  final _tarefas = <Tarefa>[];
  var _apenasNaoConcluidos = false;

  set apenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos = value;
    notifyListeners();
  }

  bool get apenasNaoConcluidos => _apenasNaoConcluidos;

  List<Tarefa> get tarefas => _apenasNaoConcluidos
      ? _tarefas.where((e) => !e.concluido).toList()
      : _tarefas;

  adicionar(Tarefa tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  remover(String id) {
    _tarefas.remove(_tarefas.where((e) => e.id == id).first);
    notifyListeners();
  }

  alterar(String id, bool concluido) {
    _tarefas.where((e) => e.id == id).first.concluido = concluido;
    notifyListeners();
  }
}
