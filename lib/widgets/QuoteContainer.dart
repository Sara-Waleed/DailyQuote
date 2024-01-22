import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Qoute_Model.dart';

class QuoteContainer extends StatelessWidget {
  final QuoteModel quote;

  QuoteContainer({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Author: ${quote.author}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Content: ${quote.content}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Tags: ${quote.tags.join(", ")}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Length: ${quote.length}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Date Added: ${quote.dateAdded}',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}