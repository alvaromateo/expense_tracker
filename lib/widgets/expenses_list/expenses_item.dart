import 'package:expense_tracker/widgets/expenses_list/expenses_item_details.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  bool _displayDetails = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          8,
          20,
          _displayDetails ? 16 : 8,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.expense.title,
                  style: TextStyle(
                    fontSize: textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                Row(
                  children: [
                    Text('${widget.expense.amount.toStringAsFixed(2)} EUR'),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          _displayDetails = !_displayDetails;
                        });
                      },
                      icon: _displayDetails
                          ? const Icon(Icons.expand_less)
                          : const Icon(Icons.expand_more),
                    ),
                  ],
                ),
              ],
            ),
            if (_displayDetails) ExpenseItemDetails(widget.expense),
          ],
        ),
      ),
    );
  }
}
