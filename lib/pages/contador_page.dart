import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/service/contador_service.dart';

class ContadorPage extends StatelessWidget {
  const ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorService>(
      builder: (_, contadorService, widget) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(contadorService.contador.toString(), style: TextStyle(
              fontSize: 25,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {
                  Provider.of<ContadorService>(context, listen: false).decrementar();
                }, child: Text("Decrementar")),
                TextButton(onPressed: () {
                  Provider.of<ContadorService>(context, listen: false).incrementar();
                }, child: Text("Incrementar")),
              ],
            )
          ],
        );
      }
    );
  }
}
