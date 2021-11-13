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
          children: [
            Card(//card alway take width of the child or the parent
              color: Colors.deepOrange,
              child: Container(
                  width: double.infinity,
                  child: Text('card1')),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Text('card2'),
              ),
            ),Container(
              width: double.infinity,
              child: Card(
                child: Text('card2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
