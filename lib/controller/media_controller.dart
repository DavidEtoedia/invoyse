import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class MediaClass {
  static late ImagePicker _picker;

  static Future<(String, String)?> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    } else {
      final appDir = await path_provider.getApplicationDocumentsDirectory();
      final localPath = path.join(appDir.path, image.path);
      File file = File(localPath);
      String fileName = file.path.split('/').last;
      return (file.path, fileName);
    }
  }

  static void init() {
    _picker = ImagePicker();
  }
}
