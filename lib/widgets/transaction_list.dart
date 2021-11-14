import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
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
    );
  }
}
