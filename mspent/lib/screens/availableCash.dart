import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transactions.dart';

class AvailableCash extends StatefulWidget {
  const AvailableCash({Key? key}) : super(key: key);

  @override
  State<AvailableCash> createState() => _AvailableCashState();
}

class _AvailableCashState extends State<AvailableCash> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var totalCashController = TextEditingController();
    var externalReceivablesController = TextEditingController();
    var debtsController = TextEditingController();
    final appBar = AppBar(
      title: Text(
        'mSpent',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      //actions: [],
    );
    final transactions = Provider.of<Transactions>(context,
        listen: false);

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: isLandscape
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Card(
                  child: Center(
                    child: Text(
                      'not available in landscape yet',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(builder: (ctx, constrain) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ListTile(
                            leading: SizedBox(
                              height: constrain.maxHeight * (1 / 5),
                              width: 100,
                              child: Card(
                                child: transactions
                                            .totalCash ==
                                        0
                                    ? TextField(
                                        keyboardType: TextInputType.number,
                                        //maxLines: 1,
                                        autofocus: true,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 25),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        controller: totalCashController,
                                        onSubmitted: (_) {
                                          transactions
                                                    .updateTotalCash(double.parse(
                                                totalCashController.text),);
                                        },
                                      )
                                    : MaterialButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: FittedBox(
                                            child: Text(
                                              transactions
                                                  .totalCash
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            title: const Text('total cash'),
                          ),
                          ListTile(
                            leading: SizedBox(
                              height: constrain.maxHeight * (1 / 5),
                              width: 100,
                              child: Card(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        transactions
                                            .total
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            title: const Text('total spent'),
                          ),
                          ListTile(
                            leading: SizedBox(
                              height: constrain.maxHeight * (1 / 5),
                              width: 100,
                              child: Card(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        (transactions
                                                    .totalCash -
                                            transactions
                                                    .total)
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            title: const Text('available cach'),
                          ),
                          ListTile(
                            leading: SizedBox(
                              height: constrain.maxHeight * (1 / 5),
                              width: 100,
                              child: Card(
                                child: transactions
                                            .externalReceivables ==
                                        0
                                    ? TextField(
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        autofocus: false,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 25),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        controller:
                                            externalReceivablesController,
                                        onSubmitted: (_) {
                                          setState(() {
                                            transactions
                                                    .externalReceivables =
                                                double.parse(
                                                    externalReceivablesController
                                                        .text);
                                          });
                                        },
                                      )
                                    : MaterialButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: FittedBox(
                                            child: Text(
                                              transactions
                                                  .externalReceivables
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            title: const Text('External receivables'),
                          ),
                          ListTile(
                            leading: SizedBox(
                              height: constrain.maxHeight * (1 / 5),
                              width: 100,
                              child: Card(
                                child: transactions
                                            .debts ==
                                        0
                                    ? TextField(
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        autofocus: false,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 25),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        controller: debtsController,
                                        onSubmitted: (_) {
                                          setState(() {
                                            transactions
                                                    .debts =
                                                double.parse(
                                                    debtsController.text);
                                          });
                                        },
                                      )
                                    : MaterialButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: FittedBox(
                                            child: Text(
                                              transactions
                                                  .debts
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            title: const Text('depts'),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
      ),
    );
  }
}
