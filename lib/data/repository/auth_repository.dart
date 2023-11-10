import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> createUser(String email, String password, String name);
  Future<User?> signInUser(String email, String password);
  Future<void> updateName(String name);
  Future<void> updateEmail(String email);
  Future<void> updateAvatar(String url);
  Stream<User?> authTokenChange();
  Stream<User?> userStateChange();
}
