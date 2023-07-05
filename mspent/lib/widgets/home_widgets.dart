import 'package:flutter/material.dart';
import 'package:mspent/widgets/chart.dart';
import 'package:provider/provider.dart';

import '../providers/transactions.dart';
import 'transView.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    title: Text(
      'mSpent',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        // color: Theme.of(context).primaryColor,
        fontSize: 28,
      ),
    ),
    backgroundColor: Colors.transparent,
    actions: [
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed('availableCash');
        },
        child: SizedBox(
          height: 60,
          width: 200,
          //color: Colors.white,
          child: Card(
            child: Center(
              child: Text(
                Provider.of<Transactions>(context, listen: false)
                    .total
                    .toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary), //textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      )
    ],
  );
}


Widget txsListWidget(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return SizedBox(
    height: (mediaQuery.size.height -
            mediaQuery.padding.top) *
        0.6,
    child: TransView(
      transactions: Provider.of<Transactions>(context).recentTransactions,
      deleteTx: Provider.of<Transactions>(context).deleteTrans,
    ),
  );
}
Widget chartWidget(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return SizedBox(
    height: (mediaQuery.size.height -
            mediaQuery.padding.top) *
        0.3,
    child: Chart(
      recentTransactions: Provider.of<Transactions>(context).recentTransactions,
    ),
  );
}
