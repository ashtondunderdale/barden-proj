import 'package:file_picker/_internal/file_picker_web.dart';

class BlobService {

  void getFiles() async {
    try {
        var chosenFiles = await FilePickerWeb.platform.pickFiles();

      

    } catch (exception) {
      print(exception);
    }
  }
}