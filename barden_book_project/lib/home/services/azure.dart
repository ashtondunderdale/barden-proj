import 'dart:convert';

import 'package:barden_book_project/_key.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:azstore/azstore.dart';

import '../../login/models/login.dart';
import '../models/book.dart';

class AzureService {
  Future<bool> loginWithUsernameAndPassword(AuthModel auth) async {

    
    return true;
  }

  Future<List<Book>?> getBooks() async {
    try {
      var storage = AzureStorage.parse(connStr);
      var result = await storage.filterTableRows(tableName: 'bookinventory', filter: "", top: 300);

      List<Book> books = [];

      for (var jsonBook in result) {
        books.add(Book(
          title: jsonBook['Title'] ?? "null title", 
          author: jsonBook['Author'] ?? "null author", 
          isbn: jsonBook['ISBN'] ?? "null isbn", 
          coverUrl: jsonBook['Cover'] ?? "null cover",
          
          category: jsonBook['Category'] ?? "",
          lexileLevel: jsonBook['Lexile_Level'] ?? "", 
          publisher: jsonBook['Publisher'] ?? "",
          readingYear: jsonBook['Reading_Year'] ?? "",
          releaseYear: jsonBook['Release_Year'] ?? "",
          language: jsonBook['Language'] ?? "",
          blScore: jsonBook['BL_Score'] ?? -1,
          numberOfCopies: jsonBook['Number_Of_Copies'] ?? -1,

          isVisible: true
        ));
      }

      print(books.length);

      return books;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  void getFiles() async {
    try {
      var chosenFiles = await FilePicker.platform.pickFiles(allowMultiple: true);    

      if (chosenFiles == null || chosenFiles.files.isEmpty) {
        return;
      }

      List<String> httpMessages = [];

      for (var file in chosenFiles.files) {
        await uploadFileToAzure(file, httpMessages);
      }

      //print("================RESPONSES================\n");
      //for (var response in httpMessages) {
        //print(response);
      //}s

    } catch (exception) {
      //print(exception);
    }
  }

  Future<bool> uploadFileToAzure(PlatformFile file, List<String> httpMessages) async {
    final fileName = file.name;
    final fileBytes = file.bytes;
    
    try {
      if (fileBytes == null) {
        throw Exception("File bytes are null");
      }

      const url = "";

      final response = await http.put(Uri.parse(url),
        headers: {
          'x-ms-blob-type': 'BlockBlob',
          'Content-Type': file.extension ?? 'application/octet-stream',
        },
        body: fileBytes,
      );

      httpMessages.add("$fileName : ${response.statusCode}");

      return response.statusCode == 200;
      
    } catch (exception) {
      httpMessages.add("$fileName : $exception");
      return false;
    }
  }

  Future<bool> addNewBook(String isbn, String year, String category) async {

      // final response = http.put(Uri.parse(""),
      //   headers: {},
      //   body: jsonEncode({}),
      // );
    await Future.delayed(const Duration(seconds: 1));

    return false;
  }
}
