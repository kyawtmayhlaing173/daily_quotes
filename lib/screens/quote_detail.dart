import 'package:flutter/material.dart';

class QuoteDetail extends StatefulWidget {
  const QuoteDetail({Key? key}) : super(key: key);

  @override
  State<QuoteDetail> createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.black12,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage('assets/background.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              _menuContainer(),
              _textContainer(),
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
            icon: const Icon(Icons.menu_rounded),
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

  Widget _textContainer() {
    return const Center(
      child: Text(
        "Each day do your best and go to the rest",
        style: TextStyle(
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
