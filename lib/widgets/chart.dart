import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        var weekDay = DateTime.now().subtract(
          Duration(
            days: index,
          ),
        );
        double totalAmount = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (weekDay.day == recentTransactions[i].date.day &&
              weekDay.month == recentTransactions[i].date.month &&
              weekDay.year == recentTransactions[i].date.year)
            totalAmount += recentTransactions[i].amount;
        }
        return {"day": DateFormat.E(weekDay), "amount": totalAmount};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
