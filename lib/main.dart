import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    /*we are now converting the Transaction
    objects into list.*/
    Transaction(
      id: 't1',
      title: "title1",
      amount: 50.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: "title2",
      amount: 99.99,
      date: DateTime.now(),
    ),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Udemy Course'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Chart',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  color: Colors.deepOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text(tx.amount.toString())),
                      Container(
                        child: Column(
                          children: [
                            Text(tx.title),
                            Text(tx.date.toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
