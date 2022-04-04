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
    return Scaffold(
      body: _quotesContainer(),
    );
  }

  Widget _quotesContainer() {
    return BlocBuilder<QuotesCubit, QuotesState>(
      builder: (context, state) {
        if (state is QuotesFetched) {
          return _quotesListContainer(state.quotes);
        } else if (state is QuotesFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Text("404 Not Found");
        }
      },
    );
  }

  _quotesListContainer(quotes) {
    print(
        "Ratio is ${MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2)}");
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  quotes[index]['body'],
                  style: GoogleFonts.ptSans(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // child: GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(2, (index) {
      //     return Container(
      //       margin: const EdgeInsets.all(10),
      //       width: MediaQuery.of(context).size.width,
      //       height: 300,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(5),
      //         color: Colors.red,
      //       ),
      //       child: Center(
      //         child: Text(
      //           'Item $index',
      //         ),
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}
