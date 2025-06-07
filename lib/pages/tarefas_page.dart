import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/tarefa.dart';
import 'package:provider_app/repository/tarefa_repository.dart';

class TarefasPage extends StatelessWidget {
  final descricaoController = TextEditingController();

  TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          Provider.of<TarefaRepository>(context, listen: false)
                              .adicionar(
                                  Tarefa(descricaoController.text, false));
                          Navigator.pop(context);
                        },
                        child: Text("Salvar"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Apenas não concluídos",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Consumer<TarefaRepository>(
                          builder: (_, tarefaRepository, widget) {
                        return Switch(
                            value: tarefaRepository.apenasNaoConcluidos,
                            onChanged: (bool value) {
                              Provider.of<TarefaRepository>(context,
                                      listen: false)
                                  .apenasNaoConcluidos = value;
                            });
                      })
                    ])),
            Expanded(child: Consumer<TarefaRepository>(
                builder: (_, tarefaRepository, widget) {
              return ListView.builder(
                  itemCount: tarefaRepository.tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = tarefaRepository.tarefas[index];
                    return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          Provider.of<TarefaRepository>(context, listen: false).remover(tarefa.id);
                        },
                        key: Key(tarefa.id),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                              value: tarefa.concluido,
                              onChanged: (bool value) async {
                                Provider.of<TarefaRepository>(context,
                                        listen: false)
                                    .alterar(tarefa.id, value);
                              }),
                        ));
                  });
            }))
          ],
        ),
      ),
    );
  }
}
