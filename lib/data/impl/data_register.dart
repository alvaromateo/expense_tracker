import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:expense_tracker/data/models/expenses_account.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataRegister {
  @preResolve
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([
      ExpenseSchema,
      ExpensesAccountSchema,
      UserSchema,
    ], directory: dir.path);
  }

  @injectable
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
