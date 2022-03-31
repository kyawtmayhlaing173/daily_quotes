import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/screens/quote_detail.dart';
import 'package:daily_quotes/widgets/bottom_tab_bar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPrimaryColor,
        ),
      ),
      // home: const QuoteDetail(),
      home: const BottomTabBarWidget(
        title: "Daily Quotes",
      ),
    );
  }
}
