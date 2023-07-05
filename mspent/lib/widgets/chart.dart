import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mspent/models/Transaction.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      var total = 0.0;

      for(var i =0 ; i< recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day&&
            recentTransactions[i].date.month == weekDay.month&&
            recentTransactions[i].date.year == weekDay.year){
          total += recentTransactions[i].amount * recentTransactions[i].price;
        }
      }

      return{'day': DateFormat.E().format(weekDay).substring(0,1),
        'total' : total,};
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['total'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(label: (data['day'] as String),
                  spendingPcntOfTotal: totalSpending == 0.0 ? 0.0 :  (data['total'] as double) / totalSpending,
                spendingAmount: (data['total'] as double)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
