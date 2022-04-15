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

  Future<bool> addQuotes(quote) async {
    bool result = false;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("quotes")
        .add({
          "quote": quote.quote,
          "backgroundUrl": quote.backgroundUrl,
          "source": "weibo",
          "timestamp": quote.timestamp,
        })
        .then(
          (value) => result = true,
        )
        .catchError(
          (err) => result = false,
        );
    print('is success, $result');
    return result;
  }
}
