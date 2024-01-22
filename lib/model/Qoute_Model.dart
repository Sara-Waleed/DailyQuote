class QuoteListModel {
  List<QuoteModel> quotes;

  QuoteListModel({
    required this.quotes,
  });

  factory QuoteListModel.fromJson(List<dynamic> json) {
    List<QuoteModel> quotes = json.map((quote) => QuoteModel.fromJson(quote)).toList();
    return QuoteListModel(quotes: quotes);
  }
}

class QuoteModel {
  String id;
  String author;
  String content;
  List<String> tags;
  String authorSlug;
  int length;
  String dateAdded;
  String dateModified;

  QuoteModel({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
      authorSlug: json['authorSlug'],
      length: json['length'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }
}
