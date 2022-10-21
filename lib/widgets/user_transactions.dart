import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transactions_list.dart';
import '../model/transaction.dart';

// Manages list and updates transactions in UI
class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'Transaction 1', amount: 1000, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Transaction 2', amount: 2000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 3', amount: 3000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 4', amount: 4000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 5', amount: 5000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 6', amount: 6000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 7', amount: 7000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 8', amount: 8000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 9', amount: 9000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          child: Text('Recent transactions'),
        ),
        NewTransaction(_addTransaction),
        TransactionsList(_transactions)
      ],
    );
  }

  void _addTransaction(String title, double amount) {
    Transaction newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }
}
