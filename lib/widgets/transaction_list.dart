import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640,
      child: _userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions Added Yet',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'lib/assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child:
                                Text('₹ ${_userTransactions[index].amount}')),
                      ),
                    ),
                    title: Text(_userTransactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(_userTransactions[index].date)),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
