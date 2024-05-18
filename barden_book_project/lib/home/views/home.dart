import 'package:barden_book_project/home/services/azure.dart';
import 'package:barden_book_project/home/widgets/add_book/add_book.dart';
import 'package:barden_book_project/home/widgets/top_title_bar.dart';
import 'package:barden_book_project/home/widgets/action_bar.dart';
import 'package:barden_book_project/home/widgets/inventory/inventory.dart';
import '../../constants.dart';

import 'package:flutter/material.dart';

import '../models/book.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _azure = AzureService();

  String activeAction = "Inventory";
  Widget activeActionBarWidget = const BardenInventory(books: []);
  String activeCategory = "";
  
  List<Book> books = [];

  @override
  void initState() {
    initializeBooks();
    super.initState();
  }

  void initializeBooks() async {
    books = await _azure.getBooks() ?? [];
    setState(() {
      activeActionBarWidget = BardenInventory(books: books);    
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BardenActionBar(
          activeAction: activeAction,
          onDashboardTap: () {
            setState(() {
              activeAction = "Inventory";
              activeActionBarWidget = BardenInventory(books: books);
            });       
          },
          addBookTap: () {
            _showAddBook(context);
          },
          onUploadTap: () async {
            _azure.getFiles();
          }
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitleBar(activeAction: activeAction),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 32),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width  - 120,
                height: MediaQuery.sizeOf(context).height - 100,
                child: activeActionBarWidget,
              ),
            ),
          ],
        )
      ],
    ),
  );

  void _showAddBook(BuildContext context) async => showDialog<void>(
    context: context,
    builder: (BuildContext context) => BardenAddBook(
      onCategoryChanged: (val) {
        setState(() {
          activeCategory = val;
        });
      }
    )
  );
}

