import 'dart:convert';

class Quote {
  String quote;
  String author;
  String dialouge;
  String timestamp;
  Quote({
    required this.quote,
    required this.author,
    required this.dialouge,
    required this.timestamp,
  });

  Quote copyWith({
    String? quote,
    String? author,
    String? dialouge,
    String? timestamp,
  }) {
    return Quote(
      quote: quote ?? this.quote,
      author: author ?? this.author,
      dialouge: dialouge ?? this.dialouge,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'author': author,
      'dialouge': dialouge,
      'timestamp': timestamp,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'] ?? '',
      author: map['author'] ?? '',
      dialouge: map['dialouge'] ?? '',
      timestamp: map['timestamp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quote(quote: $quote, author: $author, dialouge: $dialouge, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote &&
        other.quote == quote &&
        other.author == author &&
        other.dialouge == dialouge &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return quote.hashCode ^
        author.hashCode ^
        dialouge.hashCode ^
        timestamp.hashCode;
  }
}
