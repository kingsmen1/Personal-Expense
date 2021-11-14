import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  /*method 1 of TextField;*/
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

/*method 2 of TextField
  String titleInput;
  String amountInput;*/

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
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Tile'),
                      /*this is the method1 the fluter automatically
                        connects the controller: to the textFields and lisetens
                        to the userinput */

                      controller: titleInput,

                      /*this is method 2 to assign the userInput to variables
                      onChanged: (val) => titleInput = val,
                      },*/
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      /*this is the method1 the fluter automatically
                        connects the controller: to the textFields and lisetens
                        to the userinput */

                      controller: amountInput,

                      /*this is method 2 to assign the userInput to variables
                      onChanged: (val){
                        amountInput = val;
                      },*/
                    ),
                    FlatButton(
                        onPressed: () {
                          print(titleInput.text);print(amountInput.text);
                        },
                        child: Text(
                          'Add Transaction',
                          style: TextStyle(color: Colors.purple),
                        ))
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  //color: Colors.deepOrange,
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
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
