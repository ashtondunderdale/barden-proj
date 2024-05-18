import 'package:barden_book_project/home/services/blob.dart';
import 'package:barden_book_project/home/widgets/add_book/add_book.dart';
import 'package:barden_book_project/login/views/login.dart';
import 'package:barden_book_project/common/barden_button.dart';
import 'package:barden_book_project/home/widgets/action_bar.dart';
import 'package:barden_book_project/home/widgets/inventory/inventory.dart';
import '../../constants.dart';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _blob = BlobService();

  String activeAction = "Inventory";
  Widget activeActionBarWidget = BardenInventory(books: books);

  String activeCategory = "";

  @override
  void initState() {
    super.initState();
    activeCategory = readingCategories.first;
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
            _showBookDetails(context);
          },
          onUploadTap: () async {
            _blob.getFiles();
          }
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32, top: 16),
                    child: Row(
                      children: [
                        Text(
                          activeAction,
                          style: primaryFont.copyWith(
                            color: const Color.fromARGB(255, 58, 58, 58),
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BardenButton(
                  width: 100,
                  text: "LOGOUT", 
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  }, 
                  isLoading: false
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 32),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.8,
                child: activeActionBarWidget,
              ),
            ),
          ],
        )
      ],
    ),
  );

  void _showBookDetails(BuildContext context) async => showDialog<void>(
    context: context,
    builder: (BuildContext context) => BardenAddBook(
      dropdownValue: activeCategory, 
      onCategoryChanged: (val) {
        setState(() {
          activeCategory = val;
          print(activeCategory);
        });
      }
    )
  );
}

