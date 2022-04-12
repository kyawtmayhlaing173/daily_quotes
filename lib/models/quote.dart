import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Quote {
  String quote;
  String source;
  Timestamp timestamp;
  Quote({
    required this.quote,
    required this.source,
    required this.timestamp,
  });

  Quote copyWith({
    String? quote,
    String? source,
    Timestamp? timestamp,
  }) {
    return Quote(
      quote: quote ?? this.quote,
      source: source ?? this.source,
      timestamp: timestamp ?? Timestamp.fromDate(DateTime.now()),

      // timestamp: timestamp ?? Timestamp.fromDate(DateTime.now()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'source': source,
      'timestamp': timestamp,
    };
  }

  Quote.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : quote = doc.data()!["quote"],
        source = doc.data()!["source"],
        timestamp = doc.data()!["timestamp"];

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'] ?? '',
      source: map['source'] ?? '',
      timestamp: map['timestamp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quote(quote: $quote, source: $source, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote &&
        other.quote == quote &&
        other.source == source &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return quote.hashCode ^ source.hashCode ^ timestamp.hashCode;
  }
}
