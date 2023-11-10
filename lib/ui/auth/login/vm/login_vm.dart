import 'package:flutter_task/data/repository/usecase.dart';
import 'package:flutter_task/data/shared/shared_pref.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/ui/auth/login/vm/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.authUsecase) : super(const LoginStateInitial());

  AuthUsecase authUsecase;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await authUsecase.signInUser(email, password);
      state = const LoginStateSuccess();
      SharedPrefManager.isLoggedIn = true;
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref.watch(authUseCaseProvider));
});
