import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/pages/contador_page.dart';
import 'package:provider_app/pages/pagina_teste_2.dart';
import 'package:provider_app/service/dark_mode_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<DarkModeService>(
          builder: (_, darkModeService, widget) {
            return Text(
              "My App",
              style: TextStyle(
                color: darkModeService.darkMode ? Colors.white : Colors.black,
              ),
            );
          }
        ),
        actions: [
          Center(child: Text("Dark Mode")),
          // Consumer escuta apenas essa parte do widget tree
          // e reconstrói apenas o Switch quando darkMode mudar
          Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
            // Switch que altera o valor do modo escuro
            return Switch(
                value: darkModeService.darkMode,
                onChanged: (bool value) {
                  // Atualiza o valor do modo escuro com base no estado do switch
                  darkModeService.darkMode = !darkModeService.darkMode;
                });
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                posicaoPagina = value;
              });
            },
            children: [
              ContadorPage(),
              PaginaTeste2(),
            ],
          )),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.grey.shade600,
              width: 1,
            ))),
            child: Consumer<DarkModeService>(
              builder: (_, darkModeService, widget) {
                return BottomNavigationBar(
                    elevation: 0,
                    selectedItemColor:  darkModeService.darkMode ? Colors.white : Colors.black,
                    unselectedItemColor: darkModeService.darkMode ? Colors.grey[700] : Colors.grey[500],
                    currentIndex: posicaoPagina,
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                      controller.jumpToPage(value);
                    },
                    items: [
                      BottomNavigationBarItem(
                          label: "Números", icon: Icon(Icons.numbers)),
                      BottomNavigationBarItem(
                          label: "Tarefas", icon: Icon(Icons.list))
                    ]);
              }
            ),
          )
        ],
      ),
    );
  }
}
