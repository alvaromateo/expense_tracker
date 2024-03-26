import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:expense_tracker/utils.dart';
import 'package:expense_tracker/data/models/user.dart';
import 'package:expense_tracker/data/models/category.dart';

part '../generated/expense.g.dart';

@JsonSerializable()
@Collection(inheritance: false)
class Expense extends Equatable {
  final Id id = Isar.autoIncrement;
  final String title;
  final double amount;
  final DateTime date;
  final bool split;
  @enumerated
  final Category category;
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

  String get formattedDate {
    return dateFormatter.format(date);
  }

  @override
  @ignore
  List<Object> get props => [id];

  /// Deserializes the given JSON map into a [Expense].
  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  /// Converts this [Expense] into a JSON map.
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
