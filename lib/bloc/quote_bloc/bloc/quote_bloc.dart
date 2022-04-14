import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../models/quote.dart';
import '../../../repositories/data_repository.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(QuoteInitial()) {
    on<QuoteEvent>((event, emit) async {
      try {
        List<Quote> quotes = await quoteRepository.fetchDailyQuotes();
        emit(QuoteFetched(quotes));
      } catch (e) {
        emit(QuoteError());
      }
    });
  }
}
