import 'package:flutter/material.dart';

import '../models/Transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key, required this.transaction, required this.deleteTx, required this.i}) : super(key: key);
  final Transaction transaction;
  final Function deleteTx;
  final int i;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Stack(
          children: [
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: SizedBox(
            //         width: 100,
            //         height: 178,
            //         child: Card(
            //           child: MaterialButton(
            //             child: transaction.galleryImage != null
            //                 ? Image.file(
            //               transaction.galleryImage,
            //               width: 200,
            //               height: 200,
            //             )
            //                 : Icon(
            //               Icons.photo,
            //               size: 50,
            //               color: Theme.of(context).colorScheme.secondary,
            //             ),
            //             onPressed: () {},
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 130,
            //       width: 240,
            //       child: Card(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 transaction.name,
            //                 style: TextStyle(
            //                   color: Theme.of(context).primaryColor,
            //                   fontSize: 25,
            //                 ),
            //               ),
            //               Text(
            //                 '${transaction.price.toStringAsFixed(2)} EGP',
            //                 style: TextStyle(
            //                   color: Theme.of(context).primaryColor,
            //                   fontSize: 20,
            //                 ),
            //               ),
            //               Text(
            //                 'U bought ${transaction.amount}',
            //                 style: TextStyle(
            //                   color: Theme.of(context).primaryColor,
            //                   fontSize: 18,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Align(
              alignment: const Alignment(0.9, -0.8),
              child: MaterialButton(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: (){},
                onLongPress: () {
                  deleteTx(i);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
