import 'package:expense_tracker/data/models/expenses_account.dart';

abstract interface class ExpensesService {
  Stream<List<ExpensesAccount>> getExpensesAccounts();
  Future<int> saveExpensesAccount(ExpensesAccount account);
  Future<bool> deleteExpensesAccount(int id);
}
