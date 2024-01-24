import 'package:flutter/material.dart';
import '../Helper/Request.dart';
import '../model/Qoute_Model.dart';

class QuotesListView extends StatefulWidget {
  @override
  _QuotesListViewState createState() => _QuotesListViewState();
}

class _QuotesListViewState extends State<QuotesListView> {
  String apiKey = "oquNkPE8zw3n/xjWLw+b0Q==MALz65oigjvDp5nX";
  List<String> categories = [
    'age',
    'alone',
    'amazing',
    'anger',
    'architecture',
    'art',
    'attitude',
    'beauty',
    'best',
    'birthday',
    'business',
    'car',
    'change',
    'communication',
    'computers',
    'cool',
    'courage',
    'dad',
    'dating',
    'death',
    'design',
    'experience',
    'education',
    'dreams',
    'freedom',
    'funny',
    // ... add all other categories
  ];

  int currentCategoryIndex = 0; // Track the current category index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes List'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<QuoteModel>>(
            future: ApiNinjasService(apiKey: apiKey).fetchQuotes(categories[currentCategoryIndex]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No quotes available for ${categories[currentCategoryIndex]}.'),
                );
              } else {
                return Expanded(
                  child: QuoteContainerList(quotes: snapshot.data!),
                );
              }
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Load data for the next category
              setState(() {
                currentCategoryIndex = (currentCategoryIndex + 1) % categories.length;
              });
            },
            child: Text('Load Next Category'),
          ),
        ],
      ),
    );
  }
}

class QuoteContainerList extends StatelessWidget {
  final List<QuoteModel> quotes;

  QuoteContainerList({required this.quotes});

  @override
  Widget build(BuildContext context) {
    List<Widget> quoteWidgets = quotes.map((quote) {
      return QuoteContainer(quote: quote);
    }).toList();

    return ListView(
      children: quoteWidgets,
    );
  }
}

class QuoteContainer extends StatelessWidget {
  final QuoteModel quote;

  QuoteContainer({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote.quote,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            "- ${quote.author}",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
