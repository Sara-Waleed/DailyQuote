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
 var futureQuotes;

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
      body: FutureBuilder<QuoteListModel>(
        future: futureQuotes,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    QuoteListModel quotesResponse = snapshot.data!;
    return ListView.builder(
    itemCount: quotesResponse.quotes.length,
    itemBuilder: (context, index) {
    QuoteModel quote = quotesResponse.quotes[index];
    return QuoteContainer(quote: quote);
    },
    );
    } else if (snapshot.hasError) {
    return Center(
    child: Text('Error: ${snapshot.error}'),
    );
    }
    return Center(
    child: CircularProgressIndicator(),
    );
    },

      ),
    );
  }
}

