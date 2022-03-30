import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String formattedDate = '';
  @override
  void initState() {
    DateTime now = DateTime.now();
    print("Hello $now");
    setState(() {
      formattedDate = Jiffy([now.year, now.month, now.day]).yMMMMd;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyContainer(),
    );
  }

  Widget _buildBodyContainer() {
    return Column(
      children: [
        Text(
          formattedDate,
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
