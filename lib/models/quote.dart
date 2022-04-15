import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Quote {
  String quote;
  String source;
  Timestamp timestamp;
  String backgroundUrl;

  Quote({
    required this.quote,
    required this.source,
    required this.timestamp,
    required this.backgroundUrl,
  });

  Quote copyWith({
    String? quote,
    String? source,
    Timestamp? timestamp,
    String? backgroundUrl,
  }) {
    return Quote(
      quote: quote ?? this.quote,
      source: source ?? this.source,
      timestamp: timestamp ??
          Timestamp.fromDate(
            DateTime.now(),
          ),
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'source': source,
      'timestamp': timestamp,
      'backgroundUrl': backgroundUrl,
    };
  }

  Quote.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : quote = doc.data()!["quote"],
        source = doc.data()!["source"],
        timestamp = doc.data()!["timestamp"],
        backgroundUrl = doc.data()!["backgroundUrl"];

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'] ?? '',
      source: map['source'] ?? '',
      timestamp: map['timestamp'] ?? '',
      backgroundUrl: map['backgroundUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quote(quote: $quote, source: $source, timestamp: $timestamp, backgroundUrl: $backgroundUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote &&
        other.quote == quote &&
        other.source == source &&
        other.timestamp == timestamp &&
        other.backgroundUrl == backgroundUrl;
  }

  @override
  int get hashCode {
    return quote.hashCode ^ source.hashCode ^ timestamp.hashCode;
  }
}
