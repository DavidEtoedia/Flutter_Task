import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryController {
  static Future<CloudinaryResponse?> cloudinaryImage(String? image) async {
    var cloudinary = CloudinaryPublic('dnnxnfr6c', 'ouvoc5zb', cache: false);

    try {
      if (image == null) {
        return null;
      } else {
        final response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image,
              resourceType: CloudinaryResourceType.Image),
        );
        return response;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
