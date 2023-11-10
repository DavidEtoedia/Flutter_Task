import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/ui/screens/more/screens/profile/image/cloudinary_controller.dart';
import 'package:flutter_task/ui/screens/more/screens/profile/image/vm/upload_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadImageController extends StateNotifier<UploadState> {
  UploadImageController(this.ref) : super(const UploadStateInitial());
  final Ref ref;

  void uploadAvatar(String image) async {
    state = const UploadStateLoading();
    try {
      final response = await CloudinaryController.cloudinaryImage(image);
      if (response == null) return;
      await ref.read(authUseCaseProvider).updateAvatar(response.url);

      state = const UploadStateSuccess();
      ref.invalidate(authUserProvider);
    } catch (e) {
      state = UploadStateError(e.toString());
    }
  }
}

final uploadControllerProvider =
    StateNotifierProvider<UploadImageController, UploadState>((ref) {
  return UploadImageController(ref);
});
