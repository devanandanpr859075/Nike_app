// ✅ auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nike_ecom/model/Password_UserModel.dart';
import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Email_UserModel?> signUpWithEmail(UserModel user, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      return Email_UserModel(
        email: result.user?.email ?? '',
        uid: result.user?.uid ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Email already in use');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      } else if (e.code == 'weak-password') {
        throw Exception('Password too weak');
      } else {
        throw Exception(e.message ?? 'Signup failed');
      }
    } catch (e) {
      throw Exception('Signup error: $e');
    }
  }

  Future<Email_UserModel?> loginWithEmail(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Email_UserModel(email: result.user?.email ?? '', uid: result.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email');
      } else if (e.code == 'wrong-password') {
        throw Exception('Incorrect password');
      } else {
        throw Exception(e.message ?? 'Login failed');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  Future<Email_UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);

      return Email_UserModel(
        uid: result.user?.uid ?? '',
        email: result.user?.email ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Google Sign-In error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error during Google Sign-In: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}