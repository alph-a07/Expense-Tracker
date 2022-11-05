import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import './model/transaction.dart';
import './widgets/transactions_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expense Tracker',
      home: MyAppHome(), // ⭐
    );
  }
}

// Using stateful widget as primary widget does not work...Don't know why yet!
class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'Transaction 1', amount: 1000, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Transaction 2', amount: 2000, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Transaction 3', amount: 3000, date: DateTime.now()),
  ];

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      // primarySwatch : Automatically creates different shades of selected colors for different elements
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Albert Sans'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
                onPressed: () => _startNewTransaction(context),
                icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            const Card(
              child: Text('Recent transactions'),
            ),
            TransactionsList(_transactions)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _startNewTransaction(context)),
      ),
    );
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          // return GestureDetector(
          //   onTap: () {},
          //   behavior: HitTestBehavior.opaque,
          //   child: NewTransaction(_addTransaction),
          // );
          return NewTransaction(_addTransaction);
        });
  }
}
