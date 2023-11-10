import 'package:flutter_task/data/repository/usecase.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/ui/screens/more/vm/log_out_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogOutController extends StateNotifier<LogOutState> {
  LogOutController(this.authUsecase) : super(const LogOutStateInitial());

  AuthUsecase authUsecase;

  void logOut() async {
    state = const LogOutStateLoading();
    try {
      await authUsecase.signOut();
      state = const LogOutStateSuccess();
    } catch (e) {
      state = LogOutStateError(e.toString());
    }
  }
}

final logoutControllerProvider =
    StateNotifierProvider<LogOutController, LogOutState>((ref) {
  return LogOutController(ref.watch(authUseCaseProvider));
});
