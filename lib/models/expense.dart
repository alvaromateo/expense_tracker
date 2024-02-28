import 'package:expense_tracker/utils.dart';
import 'package:expense_tracker/models/person.dart';
import 'package:expense_tracker/models/category.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final Person paidBy;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.paidBy,
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

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
}

class ExpensePaidBucket with ExpensesBucket {
  @override
  final List<Expense> expenses;
  final Person payee;

  const ExpensePaidBucket({
    required this.payee,
    required this.expenses,
  });

  ExpensePaidBucket.forPayee(List<Expense> allExpenses, this.payee)
      : expenses =
            allExpenses.where((expense) => expense.paidBy == payee).toList();
}

mixin ExpensesBucket {
  List<Expense> get expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
