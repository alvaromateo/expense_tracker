import 'package:uuid/uuid.dart';

import 'package:expense_tracker/dates.dart';
import 'package:expense_tracker/models/person.dart';
import 'package:expense_tracker/models/category.dart';

const uuid = Uuid();

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
