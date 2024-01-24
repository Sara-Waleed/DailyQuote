class QuoteModel {
  final String quote; // Use lowercase for field names
  final String author; // Use lowercase for field names
  final String category;

  QuoteModel({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quote: json["quote"] as String,
      author: json["author"] as String,
      category: json["category"] as String,
    );
  }
}
