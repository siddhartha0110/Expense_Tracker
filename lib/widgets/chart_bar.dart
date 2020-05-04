import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmt;
  final double spendingPctTotal;
  ChartBar(this.label, this.spendingAmt, this.spendingPctTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 20,
            child:
                FittedBox(child: Text('₹ ${spendingAmt.toStringAsFixed(0)}'))),
        SizedBox(height: 4),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            )),
        SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}