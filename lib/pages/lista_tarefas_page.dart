import 'package:flutter/material.dart';
import 'package:lista_tarefas/widgets/todo_list_item.dart';

class ListaTarefaPage extends StatefulWidget {
  ListaTarefaPage({Key? key}) : super(key: key);

  @override
  State<ListaTarefaPage> createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage> {
  TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione Uma Tarefa',
                          hintText: "Ex: Estudar Flutter",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todos.add(todoController.text);
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.tealAccent,
                        padding: EdgeInsets.all(15),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (String todo in todos) TodoListItem(todo),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text("Voce Possui ${todos.length} Pendentes!"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.tealAccent,
                        padding: EdgeInsets.all(15),
                      ),
                      child: const Text(
                        "Limpar Tudo",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
