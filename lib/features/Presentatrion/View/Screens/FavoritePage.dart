import 'package:dailyqoute/features/Presentatrion/View/Screens/qoute.dart';
import 'package:flutter/material.dart';

import '../../../../core/Services/Api_Request.dart';
import '../../../Data/models/Qoute_Model.dart';
import '../Shared_Widgets/Qoute_Item.dart';
class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Quote>>(
        future: fetchAllQuotes(), // Use the future function to fetch quotes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            // Use the fetched quotes to build the UI
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => QouteItem(
                Author: snapshot.data![index].author,
                Content: snapshot.data![index].content,
              ),
            );
          } else {
            return Center(child: Text("Continue..."));
          }
        },
      ),
    );
  }
}