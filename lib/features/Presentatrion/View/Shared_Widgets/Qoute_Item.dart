import 'package:dailyqoute/features/Data/models/Qoute_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class QouteItem extends StatefulWidget {
  const QouteItem({required this.Author, required this.Content,Key? key}) : super(key: key);
  final String Content;
  final String Author;
  @override
  State<QouteItem> createState() => _QouteItemState();
}

class _QouteItemState extends State<QouteItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            //    color: pageColors[colorIndex],
              image: DecorationImage(
                image: AssetImage('assets/back.jpg'),
              )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.Content}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${widget.Author}',
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
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Column(
            children: [
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                  setState(() {
                    Icon(Icons.send, color: Colors.blueGrey,);
                  });
                },
                child: Icon(Icons.send, color: Colors.black,)


                ,),

              SizedBox(height: 10,),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {},
                child: Icon(Icons.favorite_border, color: Colors
                    .black,),),
            ],
          ),

        )
      ],

    );



  }
}