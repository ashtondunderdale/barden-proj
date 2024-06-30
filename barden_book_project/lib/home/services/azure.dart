import 'dart:convert';

import 'package:azstore/azstore.dart';
import 'package:http/http.dart' as http;
import '../../_key.dart';
import '../../login/models/login.dart';
import '../models/book.dart';

class AzureService {
  final _storage = AzureStorage.parse(connStr);
  
  static const String bookTableName = "bookinventory";
  static const String recordTableName = "";
  static const String userTableName = "";


  Future<bool> loginWithUsernameAndPassword(AuthModel auth) async {
    try {
      return true;
      var users = await _storage.filterTableRows(tableName: bookTableName, filter: "", top: 300);

      // for (var user in users) {
      //   var username = user["username"];
      //   var password = user["password"];

      //   return true; // remove this

      //   if (username == auth.username && password == auth.password) {
      //     return true;
      //   }
      // }

      return false;

    } catch (exception) {
      await logError("Error in loginWithUsernameAndPassword  $exception");
      return false;
    }
  }

  Future<void> logError(String error) async {
    try {
      print(error);


    } catch (exception) {
      await logError("Error in logError (confusing) $exception");
    }
  }


  Future<List<Book>?> getBooks() async {
    try {
      var result = await _storage.filterTableRows(tableName: bookTableName, filter: "", top: 300);

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
      await logError("Error in loginWithUsernameAndPassword  $exception");
      return null;
    }
  }


  Future<bool> addBook(String isbn, String year, String category, int copies) async {
    try {

      print(isbn);
      print(category);
      print(year);
      print(copies);

      var body = jsonEncode({"ISBN":isbn, "Category":category, "Year":year, "Copies": copies});

      var response = await http.post(
        Uri.parse("https://barden-book-inventory.azurewebsites.net/api/HttpTrigger1"), 
        headers: {},
        body: body
      );

      return response.statusCode == 200;

    } catch (exception) {
      logError("Error in addBook $exception");
      return false;
    }
  }


  Future<bool> removeBook(String isbn, String year, String category) async {
    try {
      var partitionKey = "1";
      var rowKey = "";

      Map<String, dynamic> rowMap = {
        "PartitionKey": partitionKey, "RowKey": rowKey
      };

      await _storage.deleteTableRow(
        tableName: bookTableName, rowKey: rowKey, partitionKey: partitionKey, 
      );

      return true;

    } catch (exception) {
      logError("Error in removeBook $exception");
      return false;
    }
  }


  Future<bool> updateBook(String isbn, String year, String category) async {
    try {
      var partitionKey = "";
      var rowKey = "";

      Map<String, dynamic> rowMap = {
        "PartitionKey": partitionKey, "RowKey": rowKey
      };

      await _storage.upsertTableRow(
        tableName: bookTableName, rowKey: rowKey, partitionKey: partitionKey, bodyMap: rowMap
      );

      return true;

    } catch (exception) {
      logError("Error in updateBook $exception");
      return false;
    }
  }
}
