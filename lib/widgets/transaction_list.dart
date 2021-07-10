import "package:flutter/material.dart";

import "../models/transaction.dart";
import "./transaction_item.dart";

// class TransactionList extends StatelessWidget {
//   final List<Transaction> transactions;

//   TransactionList(this.transactions);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       child: transactions.length == 0
//           ? Column(
//               children: <Widget>[
//                 Text(
//                   "No expenses yet!",
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 200,
//                   child: Image.asset('assets/images/waiting.png',
//                       fit: BoxFit.cover),
//                 ),
//               ],
//             )
//           : ListView.builder(
//               itemCount: transactions.length,
//               itemBuilder: (ctx, index) {
//                 return Card(
//                   child: Row(children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 15,
//                       ),
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                           width: 2,
//                         ),
//                       ),
//                       child: Text(
//                         '\$' + transactions[index].amount.toStringAsFixed(2),
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     ),
//                     Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             margin: EdgeInsets.only(bottom: 4),
//                             child: Text(
//                               transactions[index].title,
//                               style: Theme.of(context).textTheme.headline6,
//                             ),
//                           ),
//                           Text(
//                             DateFormat.yMMMMEEEEd()
//                                 .format(transactions[index].date),
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 14,
//                             ),
//                           ),
//                         ]),
//                   ]),
//                 );
//               },
//             ),
//     );
//   }
// }

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print("build() TransactionList");
    return transactions.length == 0
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "No expenses yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
          );
  }
}
