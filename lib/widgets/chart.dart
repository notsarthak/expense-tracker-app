import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";
import "./chart_bar.dart";

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
        return {
          "day": DateFormat.E().format(weekDay).toString().substring(0, 1),
          "amount": totalAmount
        };
      },
    );
  }

  double get totalSpending {
    return recentTransactions.fold(
      0.0,
      (sum, item) {
        return sum + item.amount;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ...groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
