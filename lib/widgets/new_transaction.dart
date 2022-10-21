import 'package:flutter/material.dart';

// Adds new transaction to the list, does not update UI
class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    // Watches the TextField in real-time
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    // Actions on submission
    void submit() {
      String title = titleController.text;
      double amount = double.parse(amountController.text);

      if (title.isNotEmpty && !(amount <= 0)) {
        addTransaction(
            titleController.text, double.parse(amountController.text));
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
