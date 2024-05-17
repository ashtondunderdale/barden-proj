import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class BlobService {
  final String storageAccountName = '';
  final String containerName = '';
  final String sasToken = '';

  void getFiles() async {
    try {
      var chosenFiles = await FilePicker.platform.pickFiles(allowMultiple: true);    

      if (chosenFiles == null || chosenFiles.files.isEmpty) {
        return;
      }

      for (var file in chosenFiles.files) {
        await uploadFileToAzure(file);
      }

    } catch (exception) {
      print(exception);
    }
  }

  Future<bool> uploadFileToAzure(PlatformFile file) async {
    try {
      final fileName = file.name;
      final fileBytes = file.bytes;

      print("Uploading File: $fileName");

      if (fileBytes == null) {
        throw Exception("File bytes are null");
      }

      final url = 'https://azureBlobUrl';

      final response = await http.put(
        Uri.parse(url),
        headers: {
          'x-ms-blob-type': 'BlockBlob',
          'Content-Type': file.extension ?? 'application/octet-stream',
        },
        body: fileBytes,
      );

      return response.statusCode == 200;
      
    } catch (exception) {
      print('Error uploading file: $exception');
      return false;
    }
  }
}
