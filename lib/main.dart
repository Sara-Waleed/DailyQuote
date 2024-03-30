
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/Services/Api_Request.dart';
import 'features/Data/Cubit/fetch_qoutes_cubit.dart';
import 'features/Data/models/Qoute_Model.dart';
import 'features/Presentatrion/View/Screens/FavoritePage.dart';
import 'features/Presentatrion/View/Screens/Splach.dart';
import 'features/Presentatrion/View/Shared_Widgets/Qoute_Item.dart';


void main() {
  runApp(
    DevicePreview(
      enabled:  !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchQuotesCubit(),
      child: MaterialApp(
        useInheritedMediaQuery: true ,
        debugShowCheckedModeBanner: false,
        title: 'Quotable Quotes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
       body: SelectionScreen(),
      ),
      )
    );
  }
}


// Step 1: Define the Item Model
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quote>>(
      future: fetchAllQuotes()!,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final quotes = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              final quote = quotes[index];
              return ListTile(
                style: ListTileStyle.list,
                title: Text(quote.author),
                subtitle: Text(quote.content),
                trailing: IconButton(
                  icon: Icon(
                    quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: quote.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    _toggleFavorite(quote);
                  },
                ),
              );
            },
          );
        }
      },
    );

  }

  void _toggleFavorite(Quote quote) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (quote.isFavorite) {
      favorites.remove(quote.author); // Remove from favorites
    } else {
      favorites.add(quote.author); // Add to favorites
    }
    await prefs.setStringList('favorites', favorites); // Save updated list
    quote.toggleFavorite(); // Toggle favorite status locally
  }
}

// Define a method in Quote model to toggle favorite status
class Quote {
  final String author;
  final String content;
  bool isFavorite;

  Quote({required this.author, required this.content, this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}



// Screen 2: Favorites Screen
class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _getFavorites(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final favorites = snapshot.data!;
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final favoriteName = favorites[index];
              return ListTile(
                title: Text(favoriteName),
              );
            },
          );
        }
      },
    );
  }
  Future<List<String>> _getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }
}

final List<Quote> items = [];


// Dummy list of items




