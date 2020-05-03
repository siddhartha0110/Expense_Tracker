import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amtController = TextEditingController();
  final Function createNewTx;

  NewTransaction(this.createNewTx);
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (value) => amtInput = value,
              controller: amtController,
            ),
            FlatButton(
              onPressed: () {
                createNewTx(
                    titleController.text, double.parse(amtController.text));
              },
              child: Text('Add Transaction'),
              textColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
