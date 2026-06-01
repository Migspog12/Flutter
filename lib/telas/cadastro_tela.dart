import 'package:flutter/material.dart';
import 'package:project/auth_service.dart';
import 'package:project/main.dart';

class CadastroTela extends StatefulWidget {
  @override
  State<CadastroTela> createState() => _CadastroTelaState();
}

class _CadastroTelaState extends State<CadastroTela> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final AuthService _auth = AuthService();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: nomeController, decoration: InputDecoration(labelText: "Nome")),
            SizedBox(height: 15),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 15),
            TextField(controller: senhaController, obscureText: true, decoration: InputDecoration(labelText: "Senha")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? erro = await _auth.cadastrar(
                  emailController.text,
                  senhaController.text,
                  nomeController.text,
                );
                if (erro == null) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MenuTela()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(erro)));
                }
              },
              child: Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
}