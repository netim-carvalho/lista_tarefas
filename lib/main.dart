import 'package:flutter/material.dart';
import 'package:lista_tarefas/pages/lista_tarefas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ListaTarefaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


