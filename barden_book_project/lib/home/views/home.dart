import 'package:barden_book_project/home/widgets/action_bar.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/books.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/dashboard.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/manage.dart';
import 'package:barden_book_project/home/widgets/action_bar_pages/settings.dart';
import 'package:flutter/material.dart';

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
    backgroundColor: const Color.fromARGB(255, 238, 238, 238),
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
        activeActionBarWidget
      ],
    ),
  );
}
