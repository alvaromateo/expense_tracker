import 'package:flutter/material.dart';

import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/features/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(expenses[index].id.toString()),
        background: Container(
          margin: Theme.of(context).cardTheme.margin,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseItem(
          expense: expenses[index],
          key: Key(expenses[index].id.toString()),
        ),
      ),
    );
  }
}
