import 'package:barden_book_project/authentication/views/login.dart';
import 'package:barden_book_project/authentication/widgets/barden_button.dart';
import 'package:barden_book_project/home/widgets/action_bar.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/books.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/dashboard.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/manage.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/settings.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String activeAction = "Dashboard";
  Widget activeActionBarWidget = const BardenDashboard();

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
              activeAction = "Dashboard";
              activeActionBarWidget = const BardenDashboard();
            });       
          },
          onManageTap: () {
            setState(() {
              activeAction = "Manage";
              activeActionBarWidget = const BardenManage();
            });        
          },
          onBooksTap: () {
            setState(() {
              activeAction = "Books";
              activeActionBarWidget = const BardenBooks();
            });        
          },
          onSettingsTap: () {
            setState(() {
              activeAction = "Settings";
              activeActionBarWidget = const BardenSettings();
            });       
          },
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
                    child: Text(
                      activeAction,
                      style: primaryFont.copyWith(
                        color: const Color.fromARGB(255, 36, 36, 36),
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),
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
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 235, 235),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 217, 217, 217))
                ),
                child: activeActionBarWidget,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
