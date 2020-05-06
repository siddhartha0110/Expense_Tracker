import 'dart:math';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    super.initState();
    const availableColors = [
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.teal
    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: _bgColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('₹ ${widget.userTransaction.amount}')),
          ),
        ),
        title: Text(widget.userTransaction.title,
            style: Theme.of(context).textTheme.title),
        subtitle: Text(DateFormat.yMMMd().format(widget.userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () =>
                    widget.deleteTransaction(widget.userTransaction.id),
                icon: Icon(Icons.delete_forever),
                label: Text('Remove'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () =>
                    widget.deleteTransaction(widget.userTransaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
