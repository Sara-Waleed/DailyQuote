import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../features/Data/models/Qoute_Model.dart';

Future<List<Quote>> fetchAllQuotes() async {
  final int totalPages = 50;
  final List<Quote> allQuotes = [];

  try {
    for (int page = 1; page <= totalPages; page++) {
      final url = Uri.parse('https://api.quotable.io/quotes?page=$page');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> quotesData = jsonDecode(response.body)['results'];
        allQuotes.addAll(quotesData.map((quote) => Quote.fromJson(quote)));
      } else {
        print('Failed to fetch quotes for page $page');
        // Handle error if needed
      }
    }
  } catch (e) {
    print('Error fetching quotes: $e');
    // Handle error if needed
  }

  print('Total quotes fetched: ${allQuotes.length}');
  return allQuotes;
}