import 'package:barden_book_project/home/services/azure.dart';
import 'package:barden_book_project/home/widgets/add_book/add_book.dart';
import 'package:barden_book_project/home/widgets/home/action_bar.dart';
import 'package:barden_book_project/home/widgets/inventory/inventory.dart';
import '../models/book.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';


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
  bool _isLoading = true;

  Color _currentColor = const Color.fromARGB(255, 203, 203, 203);
  
  @override
  void initState() {
    initializeBooks();
    _startColorToggle();
    super.initState();
  }

  void initializeBooks() async {
    books = await _azure.getBooks() ?? [];
    setState(() {
      _isLoading = false;
      activeActionBarWidget = BardenInventory(books: books);    
    });
  }

  void _startColorToggle() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _currentColor = _currentColor == const Color.fromARGB(255, 203, 203, 203)
            ? const Color.fromARGB(255, 230, 230, 230)
            : const Color.fromARGB(255, 203, 203, 203);
      });
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
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 120,
              height: MediaQuery.sizeOf(context).height - 100,
              child: _isLoading 
                ? _buildLoadingPlaceholder()
                : activeActionBarWidget,
            ),
          ],
        )
      ],
    ),
  );

  Widget _buildLoadingPlaceholder() => Padding(
    padding: const EdgeInsets.only(top: 88, left: 12),
    child: ListView.builder(
      itemCount: 7,
      itemBuilder: (context, rowIndex) => Padding(
        padding: const EdgeInsets.only(top: 78, left: 14, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(8, (boxIndex) =>
            AnimatedContainer(
              width: 160, height: 240,
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(4),
              ),
              duration: const Duration(seconds: 1),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitThreeInOut(
                    size: 20,
                    color: Color.fromARGB(255, 231, 231, 231),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
