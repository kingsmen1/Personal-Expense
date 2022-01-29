import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTx;
  final mediaQuery;

  TransactionItem({Key key , this.transaction, this.deleteTx , this.mediaQuery}):super(key:key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const availableColors = [Colors.red , Colors.deepOrange , Colors.purple , Colors.green];
    _bgColor  = availableColors[Random().nextInt(4)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text("\$${widget.transaction.amount}")),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
        Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: widget.mediaQuery.size.width > 411.5
            ? FlatButton.icon(
            onPressed: () {
              widget.deleteTx(widget.transaction.id);
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
            widget.deleteTx(widget.transaction.id);
          },
        ),
      ),
    );;
  }
}
