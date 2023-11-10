import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/data/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _repository;

  AuthUsecase(this._repository);

  Future<User?> createUser(String email, String password, String name) =>
      _repository.createUser(email, password, name);
  Future<User?> signInUser(String email, String password) =>
      _repository.signInUser(email, password);
  Future<void> updateName(String name) => _repository.updateName(name);
  Future<void> updateEmail(String email) => _repository.updateEmail(email);
  Future<void> updateAvatar(String url) => _repository.updateAvatar(url);

  Stream<User?> authChangeToken() => _repository.authTokenChange();
  Stream<User?> userStateChange() => _repository.userStateChange();
}
