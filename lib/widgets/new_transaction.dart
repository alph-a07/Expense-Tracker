import 'package:flutter/material.dart';

// Adds new transaction to the list, does not update UI
class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // Watches the TextField in real-time
  // INITIALISE OUTSIDE THE BUILD METHOD
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Actions on submission
    void submit() {
      String title = titleController.text;
      double amount = double.parse(amountController.text);

      if (title.isNotEmpty && !(amount <= 0)) {
        widget.addTransaction(
            titleController.text, double.parse(amountController.text));
        Navigator.of(context).pop(); // To close top most screen
      }
    }

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(label: Text('Title')),
              controller: titleController,
              onSubmitted: (_) =>
                  submit(), // _ as onSubmitted() expects a String which we don't need
            ),
            TextField(
              decoration: const InputDecoration(label: Text('Amount')),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            TextButton(
              onPressed: submit,
              child: const Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
