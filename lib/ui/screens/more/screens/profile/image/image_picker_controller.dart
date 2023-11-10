import 'package:image_picker/image_picker.dart';

class MediaClass {
  static late ImagePicker _picker;

  static Future<String?> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    } else {
      return image.path;
    }
  }

  static void init() {
    _picker = ImagePicker();
  }
}
