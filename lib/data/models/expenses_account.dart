import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/user.dart';

part '../generated/expenses_account.g.dart';

@JsonSerializable()
@Collection(inheritance: false)
class ExpensesAccount {
  final Id id = Isar.autoIncrement;
  String title;
  @JsonKey(includeFromJson: false, includeToJson: false)
  IsarLinks<Expense> expenses = IsarLinks<Expense>();
  IsarLinks<User> participants = IsarLinks<User>();

  ExpensesAccount({
    required this.title,
  });

  bool addParticipant(User person) {
    return participants.add(person);
  }

  bool removeParticipant(User person) {
    return participants.remove(person);
  }

  bool addExpense(Expense expense) {
    return expenses.add(expense);
  }

  bool removeExpense(Expense expense) {
    return expenses.remove(expense);
  }

  /// Deserializes the given JSON map into a [Expense].
  factory ExpensesAccount.fromJson(Map<String, dynamic> json) =>
      _$ExpensesAccountFromJson(json);

  /// Converts this [Expense] into a JSON map.
  Map<String, dynamic> toJson() => _$ExpensesAccountToJson(this);
}
