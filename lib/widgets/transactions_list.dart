import 'package:expense_tracker/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Displays list of added transactions
class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  static const amountStyle =
      TextStyle(fontWeight: FontWeight.w700, color: Colors.green, fontSize: 20);
  static const titleStyle = TextStyle(
      fontWeight: FontWeight.w700, color: Colors.black87, fontSize: 16);
  static const dateStyle = TextStyle(
      fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title.toString(),
                          style: titleStyle,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          //'${tx.date.day}-${tx.date.month}-${tx.date.year}',
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: dateStyle,
                        )
                      ],
                    ),
                  ),
                  Text(
                    '₹${transactions[index].amount?.toStringAsFixed(1)}',
                    style: amountStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: transactions.length,
      ),
    );
  }
}
