import 'package:daily_quotes/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/edit_quote_background_screen.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/signup_screen.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Home") {
      child = const HomeScreen();
    } else if (tabItem == "Search") {
      child = const EditQuoteBackgroundScreen();
    } else if (tabItem == "Profile") {
      print("Firebase Auth, ${FirebaseAuth.instance.currentUser}");
      FirebaseAuth.instance.currentUser != null
          ? child = const ProfileScreen()
          : child = const LoginScreen();
    } else if (tabItem == "More") {
      child = const SignUpScreen();
    } else {
      child = const LoginScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
