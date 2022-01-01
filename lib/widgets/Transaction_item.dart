import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;
  final mediaQuery;

  TransactionItem({this.transaction, this.deleteTx , this.mediaQuery});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text("\$${transaction.amount}")),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
        Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: mediaQuery.size.width > 411.5
            ? FlatButton.icon(
            onPressed: () {
              deleteTx(transaction.id);
            },
            textColor: Theme.of(context).errorColor,
            icon: Icon(Icons.delete),
            label: Text('Delete'))
            : IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
          ),
          onPressed: () {
            deleteTx(transaction.id);
          },
        ),
      ),
    );;
  }
}
