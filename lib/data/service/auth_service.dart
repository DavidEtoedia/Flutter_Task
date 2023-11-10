import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/data/exceptions/auth_exception.dart';

class AuthService {
  const AuthService(this._auth);
  final FirebaseAuth _auth;

  Stream<User?> get authStateChange => _auth.idTokenChanges();

  Future<User?> createUser(String email, String password, String name) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        await _auth.currentUser?.updateDisplayName(name);
      }
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthException('Email already in use');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password');
      } else {
        throw AuthException('An error occured. Please try again later');
      }
    }
  }

  Stream<User?> userStateChange() {
    return _auth.authStateChanges();
  }

  Future<User?> signInUser(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw AuthException('User does not exist');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password');
      } else {
        throw AuthException('An error occured. Please try again later');
      }
    }
  }

  Future<void> updateName(String name) async {
    try {
      await _auth.currentUser?.updateDisplayName(name);
    } on FirebaseAuthException catch (_) {
      throw AuthException('An error occured. Please try again later');
    }
  }

  Future<void> updateEmail(String email) async {
    try {
      await _auth.currentUser?.updateEmail(email);
    } on FirebaseAuthException catch (_) {
      throw AuthException('An error occured. Please try again later');
    }
  }

  Future<void> updateAvatar(String url) async {
    try {
      await _auth.currentUser?.updatePhotoURL(url);
    } on FirebaseAuthException catch (_) {
      throw AuthException('An error occured. Please try again later');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
