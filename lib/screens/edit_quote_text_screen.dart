import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_quotes/repositories/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/quote_bloc/bloc/quote_bloc.dart';
import '../constants/app_constants.dart';
import '../models/quote.dart';

class EditQuoteTextScreen extends StatefulWidget {
  final String selectedPattern;
  final String selectedText;
  const EditQuoteTextScreen(
      {Key? key, required this.selectedPattern, required this.selectedText})
      : super(key: key);

  @override
  State<EditQuoteTextScreen> createState() => _EditQuoteTextScreenState();
}

class _EditQuoteTextScreenState extends State<EditQuoteTextScreen> {
  final TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  bool _isPrivate = false;

  @override
  void initState() {
    super.initState();
  }

  addQuotes() async {
    QuoteRepository quoteRepository = QuoteRepository();
    Quote quote = Quote(
      backgroundUrl: widget.selectedPattern,
      quote: widget.selectedText,
      timestamp: Timestamp.fromDate(DateTime.now()),
      source: "weibo",
    );
    bool isSuccess = await quoteRepository.addQuotes(quote);
    if (isSuccess) {
      Navigator.pop(context);
      Navigator.pop(context);
      _showSnackBar("Yay! Success");
    } else {
      _showSnackBar("Oops! Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _editButtonContainer(context),
            const Text(
              'Caption',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _editTextContainer(),
            const SizedBox(height: 30),
            _editSettingContainer(),
          ],
        ),
      )),
    );
  }

  _editButtonContainer(context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: Container()),
        TextButton(
          onPressed: () {
            addQuotes();
          },
          child: const Text(
            "Post",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  _editTextContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(widget.selectedPattern),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.7),
            ),
            child: Text(
              widget.selectedText,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  _editSettingContainer() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Color(0xFFDDDDDD),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Make Quote Private",
                style: textStyle,
              ),
              Switch(
                value: _isPrivate,
                onChanged: (value) {
                  setState(() {
                    _isPrivate = !_isPrivate;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showSnackBar(message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
