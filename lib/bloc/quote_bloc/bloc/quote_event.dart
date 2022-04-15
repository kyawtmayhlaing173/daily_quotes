part of 'quote_bloc.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object> get props => [];
}

// class AddQuoteRequested extends QuoteEvent {
//   String quote;
//   String backgroundUrl;
//   Timestamp timestamp;
//   String source;

//   AddQuoteRequested({
//     required this.quote,
//     required this.backgroundUrl,
//     required this.timestamp,
//     required this.source,
//   });
// }

class GetQuoteRequested extends QuoteEvent {}
