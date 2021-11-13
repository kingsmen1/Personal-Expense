import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Udemy Course'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              //card alway take width of the child or the parent
              color: Colors.deepOrange,
              child: Container(width: double.infinity, child: Text('card1')),
            ),
            Card(
              color: Colors.blueGrey,
              child: Text('card2'),
            ),
          ],
        ),
      ),
    );
  }
}
