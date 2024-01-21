import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Qoute_Model.dart';

Future<QuotesResponse> fetchQuotes() async {
  final response = await http.get(Uri.parse('YOUR_API_ENDPOINT_HERE'));

  if (response.statusCode == 200) {
    return QuotesResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load quotes');
  }
}
