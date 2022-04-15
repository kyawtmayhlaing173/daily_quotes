import 'package:daily_quotes/services/quotes_service.dart';
import '../models/quote.dart';

class QuoteRepository implements QuoteService {
  QuoteService quoteService = QuoteService();

  @override
  Future<List<Quote>> fetchDailyQuotes() async {
    return quoteService.fetchDailyQuotes();
  }

  @override
  Future<bool> addQuotes(quote) {
    return quoteService.addQuotes(quote);
  }
}
