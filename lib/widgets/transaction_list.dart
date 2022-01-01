import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'Transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  final mediaQuery;

  TransactionList(this.transactions, this.deleteTx , this.mediaQuery);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions Added Yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/image/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index], deleteTx: deleteTx , mediaQuery:mediaQuery);
            },
            itemCount: transactions.length,
          );
  }
}
