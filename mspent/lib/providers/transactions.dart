import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mspent/helpers/db_helper.dart';

import '../models/Transaction.dart';

class Transactions with ChangeNotifier {
  List<Transaction> _userTransactions = [];

  double total = 0;
  void updateTotal(double v) {
    total = v;
    notifyListeners();
  }

  double totalCash = 0;
  void updateTotalCash(double v) {
    totalCash = v;
    notifyListeners();
  }

  double externalReceivables = 0;
  void updateExternalReceivables(double v) {
    externalReceivables = v;
    notifyListeners();
  }

  double debts = 0;
  void updateDebts(double v) {
    debts = v;
    notifyListeners();
  }

  List<Transaction> get userTransactions {
    return _userTransactions;
  }

  set userTransactions (List<Transaction> txs) {
    _userTransactions = txs;
  }

  List<Transaction> get recentTransactions {
    return (_userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    })).toList();
  }

  //double total = 0;
  int sameIndex = 0;

  bool exists(Transaction tx) {
    for (int i = 0; i < _userTransactions.length; i++) {
      if (tx.name == _userTransactions[i].name && tx.date.day == _userTransactions[i].date.day &&   tx.date.month == _userTransactions[i].date.month && tx.date.year == _userTransactions[i].date.year) {
        sameIndex = i;
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  void addNewTransaction(
      String name, double price, int amount, File? galleryImage) {
    final newTx = Transaction(
        name: name,
        price: price,
        amount: amount,
        date: DateTime.now(),
        galleryImage: galleryImage);

    if (exists(newTx)) {
      total -= (_userTransactions[sameIndex].price *
          _userTransactions[sameIndex].amount);
      _userTransactions[sameIndex].amount += newTx.amount;
      total += (_userTransactions[sameIndex].price *
          _userTransactions[sameIndex].amount);
    } else {
      _userTransactions.add(newTx);
      int n = _userTransactions.length - 1;
      for (int i = n; i > 0; i--) {
        _userTransactions[i] = _userTransactions[i - 1];
      }
      _userTransactions[0] = newTx;
      total += (newTx.price * newTx.amount);
    }
    notifyListeners();
  }

  void deleteTrans(int i) {
    total -= _userTransactions[i].price * _userTransactions[i].amount;
    _userTransactions.removeAt(i);
    notifyListeners();
  }

  // Future<void> fitchAndSetTransactions() async {
  //   notifyListeners();
  // }
}
