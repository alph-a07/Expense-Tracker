import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Tracker',
        home: Scaffold(
          appBar: AppBar(title: const Text('Expense Tracker')),
          body: const MaterialApp(home: UserTransactions()),
        ));
  }
}
