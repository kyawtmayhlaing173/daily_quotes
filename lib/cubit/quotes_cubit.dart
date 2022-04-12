import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/quote.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  List<Quote> quotes = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuotesCubit() : super(QuotesInitial()) {
    fetchDailyQuotes();
  }

  fetchDailyQuotes() async {
    print('Fetch Daily Quotes');
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("quotes").get();
    quotes = snapshot.docs
        .map((docSnapshot) => Quote.fromDocumentSnapshot(docSnapshot))
        .toList();
    emit(QuotesFetched(quotes));
  }

  // fetchDailyQuotes() async {
  //   emit(QuotesFetching());
  //   var url = Uri.parse('https://favqs.com/api/quotes/');
  //   var token = "6b649b0c321689b2531083744d391382";
  //   var response = await http.get(url, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });

  //   if (response.statusCode == 200) {
  //     // quotes = json.decode(response.body);
  //     Map<String, dynamic> map = json.decode(response.body);
  //     List<dynamic> data = map["quotes"];
  //     quotes = data;
  //     emit(QuotesFetched(quotes));
  //   } else {
  //     emit(QuotesError());
  //   }
  // }
}
