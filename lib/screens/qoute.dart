import 'package:flutter/material.dart';
import '../Helper/Request.dart';
import '../model/Qoute_Model.dart';
import '../widgets/QuoteContainer.dart';

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
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('Quotes List'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<QuoteModel>>(
            future: ApiNinjasService(apiKey: apiKey).fetchQuotes(categories[currentCategoryIndex]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.green),
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
                  child: Center(child: QuoteContainerList(quotes: snapshot.data!)),
                );
              }
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green
            ),
            onPressed: () {
              // Load data for the next category
              setState(() {
                currentCategoryIndex = (currentCategoryIndex + 1) % categories.length;
              });
            },
            child: const Text('Load Next Category'),
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
      return Center(child: QuoteContainer(quote: quote));
    }).toList();

    return ListView(
      children: quoteWidgets,
    );
  }
}


