import 'package:equatable/equatable.dart';
import 'package:expense_tracker/domain/models/category.dart';
import 'package:expense_tracker/domain/utils.dart';

import 'user.dart';

class Expense extends Equatable {
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final bool split;
  final Category category;
  final User payer;

  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.split,
    required this.category,
    required this.payer,
  });

  String get formattedDate {
    return dateFormatter.format(date);
  }

  @override
  List<Object> get props => [id];
}
