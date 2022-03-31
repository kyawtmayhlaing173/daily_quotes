import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteDetail extends StatefulWidget {
  const QuoteDetail({Key? key}) : super(key: key);

  @override
  State<QuoteDetail> createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.purple.shade200,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              _menuContainer(),
              _quoteDescriptionContainer(),
              _shareButton(),
              _likeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuContainer() {
    return Positioned(
      top: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              size: 30,
            ),
            color: Colors.white,
          ),
          // Expanded(child: Container()),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.list),
          // )
        ],
      ),
    );
  }

  Widget _quoteDescriptionContainer() {
    return Center(
      child: Text(
        "Each day do your best and go to the rest",
        style: GoogleFonts.josefinSans(
          fontStyle: FontStyle.italic,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _likeButton() {
    return Positioned(
      bottom: 10,
      right: 0,
      child: IconButton(
        icon: const Icon(
          Icons.favorite,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _shareButton() {
    return Positioned(
      bottom: 70,
      right: 0,
      child: IconButton(
        onPressed: (() {}),
        icon: const Icon(
          Icons.share_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
