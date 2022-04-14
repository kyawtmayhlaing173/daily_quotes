import 'dart:math';

import 'package:daily_quotes/bloc/quote_bloc/bloc/quote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/quotes_cubit.dart';

class QuotesListScreen extends StatefulWidget {
  const QuotesListScreen({Key? key}) : super(key: key);

  @override
  State<QuotesListScreen> createState() => _QuotesListScreenState();
}

class _QuotesListScreenState extends State<QuotesListScreen> {
  @override
  Widget build(BuildContext context) {
    return _quotesContainer();
  }

  Widget _quotesContainer() {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteInitial) {
          context.read<QuoteBloc>().add(GetQuoteRequested());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuoteFetched) {
          return _quotesListContainer(state.quotes);
        } else {
          return const Text(
              "Sorry, something happens. Please try again later.");
        }
      },
    );
  }

  _quotesListContainer(quotes) {
    return SizedBox(
      width: 390,
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        children: [
          for (var quote in quotes)
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: _quoteContainer(quote),
            ),
        ],
      ),
    );
  }

  _quoteContainer(quote) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RandomHexColor().colorRandom(),
      ),
      child: Center(
        child: Text(
          quote.quote,
          style: GoogleFonts.ptSans(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class RandomHexColor {
  static const Color one = Color(0xff4D77FF);
  static const Color two = Color(0xff56BBF1);
  static const Color three = Color(0xffF473B9);
  static const Color four = Color(0xffC65D7B);
  static const Color five = Color(0xffE45826);
  static const Color six = Color(0xff3D2C8D);
  List<Color> hexColor = [one, two, three, four, five, six];

  static final _random = Random();

  Color colorRandom() {
    return hexColor[_random.nextInt(hexColor.length)];
  }
}
