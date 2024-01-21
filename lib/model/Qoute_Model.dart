class QuotesResponse {
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<Quote>? results;

  QuotesResponse({
    this.count,
    this.totalCount,
    this.page,
    this.totalPages,
    this.lastItemIndex,
    this.results,
  });

  factory QuotesResponse.fromJson(Map<String, dynamic> json) {
    return QuotesResponse(
      count: json['count'],
      totalCount: json['totalCount'],
      page: json['page'],
      totalPages: json['totalPages'],
      lastItemIndex: json['lastItemIndex'],
      results: (json['results'] as List<dynamic>?)
          ?.map((result) => Quote.fromJson(result))
          .toList(),
    );
  }
}

class Quote {
  String? id;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Quote({
    this.id,
    this.author,
    this.content,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
      authorSlug: json['authorSlug'],
      length: json['length'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }
}
