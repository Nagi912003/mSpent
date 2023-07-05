import 'package:hive/hive.dart';
import 'package:mspent/models/Transaction.dart';

class DBHelper {

  Map<String,dynamic> fromTransactionIntoMap(Transaction tx){
    return {
      'name':tx.name,
      'price':tx.price,
      'amount':tx.amount,
      'date':tx.date,
      'galleryImage':tx.galleryImage,
    };
  }
  List<Map<String,dynamic>> fromTransactionsIntoMaps(List<Transaction> txs){
    List<Map<String,dynamic>> transactions = [];

    txs.forEach((tx) {
      transactions.add(fromTransactionIntoMap(tx));
    });
    return transactions;
  }

  Transaction fromMapIntoTransaction(Map<String,dynamic> tx){
    return Transaction(
      name : tx['name'],
      price : tx['price'],
      amount : tx['amount'],
      date : tx['date'],
      galleryImage : tx['galleryImage'],
    );
  }
  List<Transaction> fromMapsIntoTransactions(List<Map<String,dynamic>> txs){
    List<Transaction> transactions = [];

    txs.forEach((tx) {
      transactions.add(fromMapIntoTransaction(tx));
    });
    return transactions;
  }

  final Box _transactionsBox = Hive.box('transactions');


}
