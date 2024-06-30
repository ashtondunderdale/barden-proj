import 'dart:convert';

import 'package:azstore/azstore.dart';
import 'package:http/http.dart' as http;

import '../../_key.dart';
import '../../login/models/login.dart';
import '../models/book.dart';

class AzureService {

  var storage = AzureStorage.parse(connStr);
  
  static const String bookTableName = "bookinventory";


  Future<bool> loginWithUsernameAndPassword(AuthModel auth) async {
    
    return true;
  }

  Future<List<Book>?> getBooks() async {
    try {

      var result = await storage.filterTableRows(tableName: bookTableName, filter: "", top: 300);

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

      return books;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  Future<bool> addBook(String isbn, String year, String category) async {

      final response = http.put(Uri.parse(""),
        headers: {},
        body: jsonEncode({}),
      );
      
    await Future.delayed(const Duration(seconds: 1));

    return false;
  }

  Future<bool> removeBook(String isbn, String year, String category) async {

      final response = http.put(Uri.parse(""),
        headers: {},
        body: jsonEncode({}),
      );
      
    await Future.delayed(const Duration(seconds: 1));

    return false;
  }

  Future<bool> updateBook(String isbn, String year, String category) async {

      final response = http.put(Uri.parse(""),
        headers: {},
        body: jsonEncode({}),
      );
      
    await Future.delayed(const Duration(seconds: 1));

    return false;
  }
}
