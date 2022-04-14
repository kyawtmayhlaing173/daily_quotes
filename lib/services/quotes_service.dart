import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quote.dart';

class QuoteService {
  Future<List<Quote>> fetchDailyQuotes() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("quotes").get();
    return snapshot.docs
        .map((docSnapshot) => Quote.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
