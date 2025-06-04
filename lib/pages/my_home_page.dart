import 'package:flutter/material.dart';
import 'package:provider/pages/pagina_teste.dart';
import 'package:provider/pages/pagina_teste_2.dart';

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
      backgroundColor: Colors.white,
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
              PaginaTeste(),
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
            child: BottomNavigationBar(
              currentIndex: posicaoPagina,
              items: [
              BottomNavigationBarItem(
                  label: "1", icon: Icon(Icons.text_increase_sharp)),
              BottomNavigationBarItem(label: "2", icon: Icon(Icons.image))
            ]),
          )
        ],
      ),
    );
  }
}
