import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/data/repository/auth_repository.dart';
import 'package:flutter_task/data/repository/usecase.dart';
import 'package:flutter_task/data/service/auth_service.dart';
import 'package:flutter_task/data/service/auth_service_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(FirebaseAuth.instance);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthServiceImpl(ref.watch(authServiceProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authTokenChange();
});

final authUserProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.read(authRepositoryProvider).userStateChange();
});

final authUseCaseProvider = Provider<AuthUsecase>((ref) {
  return AuthUsecase(ref.watch(authRepositoryProvider));
});
