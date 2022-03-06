import 'package:flutter/material.dart';
import 'package:lista_tarefas/widgets/todo_list_item.dart';

import '../models/todo.dart';

class ListaTarefaPage extends StatefulWidget {
  ListaTarefaPage({Key? key}) : super(key: key);

  @override
  State<ListaTarefaPage> createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage> {
  TextEditingController todoController = TextEditingController();
  List<Todo> todos = [];

  Todo? deletedTodo;
  int? deletedTodoPos;

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
                      onPressed:  () {
                        setState(() {
                          Todo newTodo = Todo(
                              title: todoController.text,
                              dateTime: DateTime.now());
                          todos.add(newTodo);
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
                      for (Todo todo in todos) TodoListItem(todo, onDelete),
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
                      onPressed: todos.isEmpty ? null : showDeletedTodosConfimationDialog,
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

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Tarefa ${todo.title} foi removida com sucesso",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Desfazer',
        textColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            todos.insert(deletedTodoPos!, deletedTodo!);
          });
        },
      ),
    ));
  }

  void showDeletedTodosConfimationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Deletar Tudo?"),
        content: Text("Voce Tem Certeza que Deseja Apagar Todas as Tarefas?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancelar"),
            style: TextButton.styleFrom(primary: Colors.blueAccent),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                todos.clear();
              });
              Navigator.of(context).pop();
            },
            child: Text("Limpar Tudo"),
            style: TextButton.styleFrom(primary: Colors.red),
          )
        ],
      ),
    );
  }
}
