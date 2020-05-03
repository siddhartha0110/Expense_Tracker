import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function createNewTx;

  NewTransaction(this.createNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amtController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.parse(amtController.text);
    if (enteredTitle.isEmpty || enteredAmt <= 0) {
      return;
    }
    widget.createNewTx(enteredTitle, enteredAmt);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (value) => titleInput = value,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (value) => amtInput = value,
              controller: amtController,
              keyboardType: TextInputType.numberWithOptions(),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
