import 'package:flutter/material.dart';
import 'package:project/auth_service.dart';
import 'package:project/main.dart';
import 'package:project/telas/login_tela.dart';

class DeletarContaTela extends StatefulWidget {
  @override
  State<DeletarContaTela> createState() => _DeletarContaTelaState();
}

class _DeletarContaTelaState extends State<DeletarContaTela> {
  final AuthService _auth = AuthService();
  final senhaController = TextEditingController();
  bool _carregando = false;

  void _confirmarDeletar() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text("Deletar conta"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Tem certeza? Essa ação é permanente e não pode ser desfeita."),
            SizedBox(height: 15),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Digite sua senha para confirmar",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              setState(() => _carregando = true);
              String? erro = await _auth.deletarConta(senhaController.text);
              if (erro == null) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginTela()),
                  (route) => false,
                );
              } else {
                setState(() => _carregando = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro: $erro')),
                );
              }
            },
            child: Text("Deletar", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Deletar Conta",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_rounded, size: 80, color: Colors.red),
            SizedBox(height: 20),
            Text(
              "Deletar sua conta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Ao deletar sua conta, todos os seus dados serão removidos permanentemente. Essa ação não pode ser desfeita.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 40),
            _carregando
                ? CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _confirmarDeletar,
                      child: Text(
                        "Deletar minha conta",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MenuTela()),
              ),
              child: Text("Cancelar"),
            ),
          ],
        ),
      ),
    );
  }
}