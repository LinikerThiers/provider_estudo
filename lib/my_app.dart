import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/pages/my_home_page.dart';
import 'package:provider_app/repository/tarefa_repository.dart';
import 'package:provider_app/service/contador_service.dart';
import 'package:provider_app/service/dark_mode_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (_) => DarkModeService()),
        ChangeNotifierProvider<ContadorService>(
            create: (_) => ContadorService()),
        ChangeNotifierProvider<TarefaRepository>(create: (_) => TarefaRepository()),
      ],
      //Ao utilizar o MultiProvider podemos usar os provider criados
      //Nesse caso foi criado o provider do tipo DarkModeService
      //que exige uma função que irá instanciar a função DarkModeService
      child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme:
              darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}
