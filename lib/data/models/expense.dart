import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:expense_tracker/data/models/user.dart';
import 'package:expense_tracker/data/models/category.dart';

part '../generated/expense.g.dart';

@JsonSerializable()
@Collection(inheritance: false)
class Expense {
  final Id id = Isar.autoIncrement;
  String title;
  double amount;
  DateTime date;
  bool split;

  @enumerated
  Category category;

  @JsonKey(includeToJson: false, includeFromJson: false)
  final IsarLink<User> payer = IsarLink<User>();

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.split = true,
    User? payer,
  }) {
    if (payer != null) {
      this.payer.value = payer;
    }
  }

  /// Deserializes the given JSON map into a [Expense].
  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  /// Converts this [Expense] into a JSON map.
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
