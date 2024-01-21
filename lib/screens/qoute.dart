import 'package:flutter/material.dart';

import '../Helper/Request.dart';
import '../model/Qoute_Model.dart';
import '../widgets/QuoteContainer.dart';

// Define your QuotesResponse and Quote classes here

class QuotesListView extends StatefulWidget {
  @override
  _QuotesListViewState createState() => _QuotesListViewState();
}

class _QuotesListViewState extends State<QuotesListView> {
  late Future<QuotesResponse> futureQuotes;

  @override
  void initState() {
    super.initState();
    futureQuotes = fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes List'),
      ),
      body: FutureBuilder<QuotesResponse>(
        future: futureQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.results?.length ?? 0,
              itemBuilder: (context, index) {
                Quote quote = snapshot.data!.results![index];
                return QuoteContainer(quote: quote);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

