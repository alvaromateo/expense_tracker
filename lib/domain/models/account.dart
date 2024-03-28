import 'package:equatable/equatable.dart';

import 'expense.dart';
import 'user.dart';

class ExpensesAccount extends Equatable {
  final int id;
  final String title;
  final List<Expense> expenses;
  final List<User> participants;

  ExpensesAccount({
    required this.id,
    required this.title,
    List<Expense>? expenses,
    List<User>? participants,
  })  : expenses = expenses ?? List.empty(),
        participants = participants ?? List.empty();

  void addParticipant(User person) {
    return participants.add(person);
  }

  bool removeParticipant(User person) {
    return participants.remove(person);
  }

  void addExpense(Expense expense) {
    return expenses.add(expense);
  }

  bool removeExpense(Expense expense) {
    return expenses.remove(expense);
  }

  @override
  List<Object> get props => [id];
}
