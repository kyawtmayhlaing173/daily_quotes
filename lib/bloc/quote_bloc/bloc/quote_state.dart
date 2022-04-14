part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

// ignore: must_be_immutable
class QuoteFetched extends QuoteState {
  List<Quote> quotes;
  QuoteFetched(
    this.quotes,
  );

  QuoteFetched copyWith({
    List<Quote>? quotes,
  }) {
    return QuoteFetched(
      quotes ?? this.quotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quotes': quotes.map((x) => x.toMap()).toList(),
    };
  }

  factory QuoteFetched.fromMap(Map<String, dynamic> map) {
    return QuoteFetched(
      List<Quote>.from(map['quotes']?.map((x) => Quote.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteFetched.fromJson(String source) =>
      QuoteFetched.fromMap(json.decode(source));

  @override
  String toString() => 'QuoteFetched(quotes: $quotes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuoteFetched && listEquals(other.quotes, quotes);
  }

  @override
  int get hashCode => quotes.hashCode;
}

class QuoteError extends QuoteState {}
