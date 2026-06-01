import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // CREATE - Cadastrar
  Future<String?> cadastrar(String email, String senha, String nome) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      await _db.collection('usuarios').doc(cred.user!.uid).set({
        'nome': nome,
        'email': email,
        'criadoEm': DateTime.now(),
      });
      return null; // sucesso
    } catch (e) {
      return e.toString(); // erro
    }
  }

  // READ - Login
  Future<String?> login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // UPDATE - Atualizar nome
  Future<void> atualizarNome(String novoNome) async {
    String uid = _auth.currentUser!.uid;
    await _db.collection('usuarios').doc(uid).update({'nome': novoNome});
  }

  // DELETE - Deletar conta
  Future<String?> deletarConta(String senha) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: senha,
      );
      await user.reauthenticateWithCredential(credential);
      String uid = user.uid;
      await _db.collection('usuarios').doc(uid).delete();
      await user.delete();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Logout
  Future<void> logout() async => await _auth.signOut();

  // Usuário atual
  User? get usuarioAtual => _auth.currentUser;
}
