import 'package:flutter/material.dart';

import 'package:expense_tracker/data/models/expense.dart';

const nextLine = SizedBox(height: 8);
const inlineSpace = SizedBox(width: 8);

class ExpenseItemDetails extends StatelessWidget {
  final Expense expense;

  const ExpenseItemDetails(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        nextLine,
        Container(
          alignment: Alignment.centerLeft,
          child: Text(expense.formattedDate),
        ),
        nextLine,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(expense.category.icon),
            inlineSpace,
            Text(expense.category.displayName),
          ],
        ),
        nextLine,
        Row(
          children: [
            const Icon(Icons.person),
            inlineSpace,
            Text(
                '${expense.payer.value?.firstName} ${expense.payer.value?.lastName}'),
          ],
        )
      ],
    );
  }
}
