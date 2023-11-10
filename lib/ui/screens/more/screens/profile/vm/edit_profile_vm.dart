import 'package:flutter_task/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'edit_profile_state.dart';

class EditProfileController extends StateNotifier<UpdateState> {
  EditProfileController(this.ref) : super(const UpdateStateInitial());
  final Ref ref;

  void editProfile(String name, String email) async {
    state = const UpdateStateLoading();
    try {
      await ref.read(authUseCaseProvider).updateName(name);
      await ref.read(authUseCaseProvider).updateEmail(email);

      state = const UpdateStateSuccess();
      ref.invalidate(authUserProvider);
    } catch (e) {
      state = UpdateStateError(e.toString());
    }
  }
}

final editProfileControllerProvider =
    StateNotifierProvider<EditProfileController, UpdateState>((ref) {
  return EditProfileController(ref);
});
