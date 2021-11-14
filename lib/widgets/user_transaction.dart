import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_list.dart';
import 'new_transactions.dart';


class UserTransactionsState extends StatefulWidget {

  @override
  _UserTransactionsStateState createState() => _UserTransactionsStateState();
}

class _UserTransactionsStateState extends State<UserTransactionsState> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(date: DateTime.now(),
        amount: txAmount,
        title: txTitle,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
