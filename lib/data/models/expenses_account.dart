import 'package:equatable/equatable.dart';
import 'package:expense_tracker/utils.dart';

import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expenses_account.g.dart';

@JsonSerializable()
class ExpensesAccount extends Equatable {
  final String id;
  final String title;
  final List<Expense> expenses = [];
  final List<Person> participants;

  ExpensesAccount({
    String? id,
    required this.title,
    required this.participants,
  }) : id = id ?? uuid.v4();

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

  @override
  List<Object> get props => [id];

  /// Deserializes the given JSON map into a [Expense].
  factory ExpensesAccount.fromJson(Map<String, dynamic> json) =>
      _$ExpensesAccountFromJson(json);

  /// Converts this [Expense] into a JSON map.
  Map<String, dynamic> toJson() => _$ExpensesAccountToJson(this);
}
