import 'package:flutter_task/data/repository/usecase.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/ui/auth/register/vm/register_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.authUsecase) : super(const RegisterStateInitial());

  AuthUsecase authUsecase;

  void register(String email, String password, String name) async {
    state = const RegisterStateLoading();
    try {
      await authUsecase.createUser(email, password, name);
      state = const RegisterStateSuccess();
    } catch (e) {
      state = RegisterStateError(e.toString());
    }
  }
}

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>((ref) {
  return RegisterController(ref.watch(authUseCaseProvider));
});
