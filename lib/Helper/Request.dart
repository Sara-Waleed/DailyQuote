import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Qoute_Model.dart';

class ApiNinjasService {
  final String apiKey;

  ApiNinjasService({required this.apiKey});

  Future<List<QuoteModel>> fetchQuotes(String category) async {
    final url = 'https://api.api-ninjas.com/v1/quotes?category=$category';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'X-Api-Key': apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<QuoteModel> quotes = jsonList
            .map((json) => QuoteModel.fromJson(json))
            .toList();

        return quotes;
      } else {
        throw Exception('Failed to load quotes. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching quotes: $error');
    }
  }
}