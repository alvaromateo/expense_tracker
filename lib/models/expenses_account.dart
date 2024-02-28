import 'package:expense_tracker/utils.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/person.dart';

class ExpensesAccount {
  final String id;
  final String title;
  final List<Expense> expenses = [];
  final List<Person> participants;

  ExpensesAccount({
    required this.title,
    required this.participants,
  }) : id = uuid.v4();

  void addParticipant(Person person) {
    participants.add(person);
  }

  void removeParticipant(Person person) {
    participants.remove(person);
  }

  void addExpense(Expense expense, [int? index]) {
    if (index != null) {
      expenses.insert(index, expense);
    } else {
      expenses.add(expense);
    }
  }

  int removeExpense(Expense expense) {
    final index = expenses.indexOf(expense);
    if (index >= 0 && index < expenses.length) {
      expenses.removeAt(index);
    }
    return index;
  }
}
