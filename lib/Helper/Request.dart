import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Qoute_Model.dart';


Future<QuoteListModel> fetchQuotes() async {
  final response = await http.get(Uri.parse('https://api.quotable.io/quotes'));
  if (response.statusCode == 200) {
    return QuoteListModel.fromJson(response.body as List);
  } else {
    throw Exception('Failed to load quotes');
  }
}

// Future<QuoteListModel> fetchQuotes() async {
//   final response = await http.get(Uri.parse('https://api.quotable.io/quotes'));
//
//   if (response.statusCode == 200) {
//     return QuoteListModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load quotes');
//   }
// }
