import 'dart:io';

class Transaction {
  final String name;
  final double price;
  int amount;
  final DateTime date;
  final File? galleryImage;

  Transaction({
    required this.name,
    required this.price,
    required this.amount,
    required this.date,
    required this.galleryImage,
  });
}
