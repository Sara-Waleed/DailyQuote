import 'package:dailyqoute/screens/qoute.dart';
import 'package:flutter/material.dart';

class Splach  extends StatelessWidget {
  const Splach ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/splach.jpg"),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>QuotesListView(),));
            }, child: Text("Welcom ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
          ),
        ],
      ),
    );
  }
}
