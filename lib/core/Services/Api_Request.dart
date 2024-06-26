import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../features/Data/models/Qoute_Model.dart';



Future<List<Quote>> fetchAllQuotes() async {
  final List<Quote> quotes = [];

  try {
    final url = Uri.parse('https://api.quotable.io/quotes?page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> quotesData = jsonDecode(response.body)['results'];
      quotes.addAll(quotesData.map((quote) => Quote.fromJson(quote)));
      print("success");
    } else {
      print('Failed to fetch quotes for the first page');
      // Handle error if needed
    }
  } catch (e) {
    print('Error fetching quotes: $e');
    // Handle error if needed
  }

  print('Total quotes fetched: ${quotes.length}');
  return quotes;
}


//
// Future<List<Quote>> fetchAllQuotes() async {
//   final int totalPages = 50;
//   final List<Quote> allQuotes = [];
//
//   try {
//     for (int page = 1; page <= totalPages; page++) {
//       final url = Uri.parse('https://api.quotable.io/quotes?page=1');
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         final List<dynamic> quotesData = jsonDecode(response.body)['results'];
//         allQuotes.addAll(quotesData.map((quote) => Quote.fromJson(quote)));
//       } else {
//         print('Failed to fetch quotes for page 1');
//         // Handle error if needed
//       }
//     }
//   } catch (e) {
//     print('Error fetching quotes: $e');
//     // Handle error if needed
//   }
//
//   print('Total quotes fetched: ${allQuotes.length}');
//   return allQuotes;
// }