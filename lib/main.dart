
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/Data/Cubit/fetch_qoutes_cubit.dart';
import 'features/Presentatrion/View/Screens/FavoritePage.dart';
import 'features/Presentatrion/View/Screens/Splach.dart';
import 'features/Presentatrion/View/Screens/qoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchQuotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quotable Quotes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splach(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    QuoteListScreen(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display only the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
