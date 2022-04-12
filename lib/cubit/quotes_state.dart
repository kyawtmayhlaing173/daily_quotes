part of 'quotes_cubit.dart';

@immutable
abstract class QuotesState {}

class QuotesInitial extends QuotesState {}

class QuotesFetched extends QuotesState {
  List<Quote> quotes;
  QuotesFetched(
    this.quotes,
  );

  QuotesFetched copyWith({
    List<Quote>? quotes,
  }) {
    return QuotesFetched(
      quotes ?? this.quotes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quotes': quotes.map((x) => x.toMap()).toList(),
    };
  }

  factory QuotesFetched.fromMap(Map<String, dynamic> map) {
    return QuotesFetched(
      List<Quote>.from(map['quotes']?.map((x) => Quote.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuotesFetched.fromJson(String source) =>
      QuotesFetched.fromMap(json.decode(source));

  @override
  String toString() => 'QuotesFetched(quotes: $quotes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuotesFetched && listEquals(other.quotes, quotes);
  }

  @override
  int get hashCode => quotes.hashCode;
}

class QuotesFetching extends QuotesState {}

class QuotesError extends QuotesState {}
