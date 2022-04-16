import 'package:daily_quotes/screens/edit_quote_background_screen.dart';
import 'package:daily_quotes/screens/login_screen.dart';
import 'package:daily_quotes/screens/profile_screen.dart';
import 'package:daily_quotes/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/auth_bloc.dart';
import '../constants/app_constants.dart';
import '../fab_button_app_bar.dart';
import '../screens/home_screen.dart';

class BottomTabBarWidget extends StatefulWidget {
  const BottomTabBarWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BottomTabBarWidget> createState() => _BottomTabBarWidgetState();
}

class _BottomTabBarWidgetState extends State<BottomTabBarWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const EditQuoteBackgroundScreen(),
    FirebaseAuth.instance.currentUser != null
        ? const ProfileScreen()
        : const LoginScreen(),
    const Text(
      'Index 3: University',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: kTertiaryColor,
        backgroundColor: kPrimaryColor,
        selectedColor: Colors.white,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Profile'),
          FABBottomAppBarItem(iconData: Icons.more_horiz, text: 'More'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditQuoteBackgroundScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
          elevation: 2.0,
        ),
      ),
    );
  }
}
