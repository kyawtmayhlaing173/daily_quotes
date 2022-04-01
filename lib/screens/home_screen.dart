import 'package:daily_quotes/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/quotes_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String formattedDate = '';
  List dailyQuote = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(vsync: this, length: 3);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: GoogleFonts.ptSans(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 5),
              _tabContainer(_tabController),
              const SizedBox(height: 20),
              _quotesContainer(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _tabContainer(TabController _tabController) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(left: 10, right: 10),
          unselectedLabelColor: Colors.grey,
          labelColor: kPrimaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: kPrimaryColor),
          ),
          tabs: const [
            Tab(
              child: Text(
                "FOR YOU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "LATEST",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "MEME",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quotesContainer() {
    return BlocBuilder<QuotesCubit, QuotesState>(
      builder: (context, state) {
        if (state is QuotesFetched) {
          return Container(
            child: Text(state.quotes[0]['body']),
          );
        } else if (state is QuotesFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: const Text("404 Not Found"),
        );
      },
    );
  }
}
