import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/data/repository/auth_repository.dart';
import 'package:flutter_task/data/service/auth_service.dart';

class AuthServiceImpl implements AuthRepository {
  final AuthService _service;

  AuthServiceImpl(this._service);

  @override
  Stream<User?> authTokenChange() => _service.authTokenChange();

  @override
  Future<User?> createUser(String email, String password, String name) =>
      _service.createUser(email, password, name);

  @override
  Future<User?> signInUser(String email, String password) =>
      _service.signInUser(email, password);

  @override
  Stream<User?> userStateChange() => _service.userStateChange();

  @override
  Future<void> updateAvatar(String url) => _service.updateAvatar(url);

  @override
  Future<void> updateEmail(String email) => _service.updateEmail(email);

  @override
  Future<void> updateName(String name) => _service.updateName(name);
}
