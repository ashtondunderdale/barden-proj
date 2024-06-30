// void getFiles() async {
//     try {
//       var chosenFiles = await FilePicker.platform.pickFiles(allowMultiple: true);    

//       if (chosenFiles == null || chosenFiles.files.isEmpty) {
//         return;
//       }

//       List<String> httpMessages = [];

//       for (var file in chosenFiles.files) {
//         await uploadFileToAzure(file, httpMessages);
//       }

//       //print("================RESPONSES================\n");
//       //for (var response in httpMessages) {
//         //print(response);
//       //}s

//     } catch (exception) {
//       //print(exception);
//     }
//   }

//   Future<bool> uploadFileToAzure(PlatformFile file, List<String> httpMessages) async {
//     final fileName = file.name;
//     final fileBytes = file.bytes;
    
//     try {
//       if (fileBytes == null) {
//         throw Exception("File bytes are null");
//       }

//       const url = "";

//       final response = await http.put(Uri.parse(url),
//         headers: {
//           'x-ms-blob-type': 'BlockBlob',
//           'Content-Type': file.extension ?? 'application/octet-stream',
//         },
//         body: fileBytes,
//       );

//       httpMessages.add("$fileName : ${response.statusCode}");

//       return response.statusCode == 200;
      
//     } catch (exception) {
//       httpMessages.add("$fileName : $exception");
//       return false;
//     }
//   }