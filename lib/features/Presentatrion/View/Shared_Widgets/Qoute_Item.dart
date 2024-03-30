import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data/models/Qoute_Model.dart';


class QouteItem extends StatelessWidget {
  const QouteItem({required this.author, required this.content, Key? key})
      : super(key: key);
  final String content;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/back.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '$content',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '$author',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      // Implement sending functionality
                    },
                    child: Icon(Icons.send, color: Colors.black),
                  ),
                  SizedBox(width: 30),
                  FloatingActionButton(
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      _addToFavorites(author);
                    },
                    child: Icon(Icons.favorite_border, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _addToFavorites(String author) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.add(author);
    await prefs.setStringList('favorites', favorites);
  }
}
