import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // registration
  Future createNewUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  //Login

  Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result;
    }catch(e){
      print(e.toString());
    }
  }

  //SignOut

Future signOut() async{
    try{
      return _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
}
