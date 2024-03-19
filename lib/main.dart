
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/Services/Api_Request.dart';
import 'features/Data/models/Qoute_Model.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotable Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuoteListScreen(),
    );
  }
}
class QuoteListScreen extends StatefulWidget {
  @override
  _QuoteListScreenState createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {
  late Future<List<Quote>> futureQuotes;

  @override
  void initState() {
    super.initState();
    futureQuotes = fetchAllQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(' Quotes'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Quote>>(
          future: futureQuotes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _buildQuotePage(snapshot.data![index], index);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildQuotePage(Quote quote, int index) {
    List<Color> pageColors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,

    ];
    int colorIndex = index % pageColors.length;
    return Container(
      decoration: BoxDecoration(
        color: pageColors[colorIndex],
        // image: DecorationImage(
        //   image: AssetImage('assets/back.jpg'), // Replace with your image path
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " ' ${quote.content}' ",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,

                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '- ${quote.author}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,


                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
