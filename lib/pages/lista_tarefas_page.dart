import 'package:flutter/material.dart';

class ListaTarefaPage extends StatelessWidget {
  ListaTarefaPage({Key? key}) : super(key: key);

  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: Text("ENTRAR"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailController.text;
    print("$text Entrou");
  }
}
