import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/auth_service.dart';
import 'package:project/telas/cadastro_tela.dart';

class LoginTela extends StatefulWidget {
  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final AuthService _auth = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 80, color: Colors.black),
              SizedBox(height: 20),
              Text("Bem-vindo!", style: TextStyle(fontSize: 23)),
              SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    String? erro = await _auth.login(
                      emailController.text,
                      senhaController.text,
                    );
                    if (erro == null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => MenuTela()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro: $erro')),
                      );
                    }
                  },
                  child: Text("Entrar"),
                ),
              ),

              SizedBox(height: 10),
              TextButton(onPressed: () {}, child: Text("Esqueci minha senha")),

              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CadastroTela()),
                  );
                },
                child: Text("Não tem conta? Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}