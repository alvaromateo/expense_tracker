import 'package:expense_tracker/data/models/category.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/user.dart';

class ExpenseCategoryBucket with ExpensesBucket {
  @override
  final List<Expense> expenses;
  final Category category;

  const ExpenseCategoryBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseCategoryBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  @override
  bool operator ==(Object other) =>
      super == other &&
      other is ExpenseCategoryBucket &&
      category == other.category;

  @override
  int get hashCode => expenses.hashCode + category.hashCode;
}

class ExpensePaidBucket with ExpensesBucket {
  @override
  final List<Expense> expenses;
  final User payee;

  const ExpensePaidBucket({
    required this.payee,
    required this.expenses,
  });

  ExpensePaidBucket.forPayee(List<Expense> allExpenses, this.payee)
      : expenses = allExpenses
            .where((expense) => expense.payer.value == payee)
            .toList();

  @override
  bool operator ==(Object other) =>
      super == other && other is ExpensePaidBucket && payee == other.payee;

  @override
  int get hashCode => expenses.hashCode + payee.hashCode;
}

abstract mixin class ExpensesBucket {
  List<Expense> get expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesBucket &&
          runtimeType == other.runtimeType &&
          hasSameExpenses(other.expenses);

  bool hasSameExpenses(List<Expense> otherExpenses) {
    return otherExpenses.every((element) => expenses.contains(element)) &&
        otherExpenses.length == expenses.length;
  }

  @override
  int get hashCode => expenses.hashCode;
}
