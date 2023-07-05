import 'package:flutter/material.dart';
import 'package:mspent/widgets/transaction_item.dart';

import '../models/Transaction.dart';

class TransView extends StatefulWidget {
  const TransView({Key? key, required this.transactions, required this.deleteTx}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  State<TransView> createState() => _TransViewState();
}

class _TransViewState extends State<TransView> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isNotEmpty?
    ListView.builder(
        itemBuilder: (ctx, i) {
          return TransactionItem(transaction: widget.transactions[i], deleteTx: widget.deleteTx, i: i);
        },
        itemCount: widget.transactions.length,
      ):LayoutBuilder(builder: (context,constraint){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: constraint.maxHeight * 0.15,child: Text('No transactions added yet', style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.secondary,),)),
              SizedBox(height: constraint.maxHeight *0.02,),
              SizedBox(
                height: constraint.maxHeight *0.7,
                child: Image.asset(
                  'assets/images/waiting.png',
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        );
    });
  }
}
