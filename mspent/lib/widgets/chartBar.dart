import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPcntOfTotal})
      : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPcntOfTotal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraint){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: constraint.maxHeight *0.15,
            child: FittedBox(
              child: Text('EGP ${spendingAmount.toStringAsFixed(0)}', style: const TextStyle(color: Colors.blueGrey),),
            ),
          ),
          SizedBox(
            height: constraint.maxHeight *0.05,
          ),
          SizedBox(
            height: constraint.maxHeight* 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPcntOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight *0.05,
          ),
          SizedBox(
            height: constraint.maxHeight *0.15,
              child: Text(label, style: TextStyle(fontSize: 15 * MediaQuery.of(context).textScaleFactor, color: Colors.blueGrey),),),
        ],
      );
    },);
  }
}
