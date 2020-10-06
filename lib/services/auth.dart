import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<AuthResult> signUp(String email, String password) async {
    final AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future<AuthResult> signIn(String email, String password) async {
    final AuthResult _authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _authResult;
  }

  Future signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(authCredential);
    FirebaseUser firebaseUser = authResult.user;
    _googleSignIn.signInSilently();
  }
}
