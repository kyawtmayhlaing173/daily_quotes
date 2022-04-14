part of 'quote_bloc.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object> get props => [];
}

class AddQuoteRequested extends QuoteEvent {}

class GetQuoteRequested extends QuoteEvent {}
