import 'package:flutter/material.dart';

import '../../post/page/posts_page.dart';

class HomeNavigationPage extends StatefulWidget {
  const HomeNavigationPage({Key? key}) : super(key: key);

  @override
  HomeNavigationPageState createState() => HomeNavigationPageState();
}

class HomeNavigationPageState extends State {
  int _selectedTab = 0;

  final List _pages = [
    const Center(
      child: Text("Welcome to Bidvest Home Page"),
    ),
    const PostsPage(title: "Products"),
    const Center(
      child: Text("Contact"),
    ),
    const Center(
      child: Text("Settings"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: "Contact"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
