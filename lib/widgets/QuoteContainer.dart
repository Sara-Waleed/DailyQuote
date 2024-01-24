import 'package:flutter/material.dart';

import '../model/Qoute_Model.dart';

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