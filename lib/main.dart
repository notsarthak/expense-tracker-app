import 'package:flutter/material.dart';

import "./transaction.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("Chart"),
              ),
            ),
            Column(children: <Widget>[
              ...transactions.map((tx) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      child: Text(
                        tx.amount.toString(),
                      ),
                    ),
                    Column(children: <Widget>[
                      Text(
                        tx.title,
                      ),
                      Text(
                        tx.date.toString(),
                      ),
                    ]),
                  ]),
                );
              }).toList()
            ]),
          ]),
    );
  }
}
