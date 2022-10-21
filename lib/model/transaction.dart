import 'package:flutter/material.dart';

class Transaction {
  @required
  final String? id;
  @required
  final double? amount;
  @required
  final String? title;
  @required
  final DateTime date;

  Transaction({
    this.id,
    this.amount,
    this.title,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
