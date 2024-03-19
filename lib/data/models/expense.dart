import 'package:equatable/equatable.dart';
import 'package:expense_tracker/utils.dart';
import 'package:expense_tracker/data/models/person.dart';
import 'package:expense_tracker/data/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

@JsonSerializable()
class Expense extends Equatable {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final Person paidBy;

  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.paidBy,
  }) : id = id ?? uuid.v4();

  String get formattedDate {
    return dateFormatter.format(date);
  }

  @override
  List<Object> get props => [id];

  /// Deserializes the given JSON map into a [Expense].
  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  /// Converts this [Expense] into a JSON map.
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
