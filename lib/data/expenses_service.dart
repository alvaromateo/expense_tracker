import 'package:expense_tracker/data/models/expenses_account.dart';

abstract class ExpensesService {
  const ExpensesService();

  Stream<List<ExpensesAccount>> getExpensesAccounts();
  Future<ExpensesAccount> saveExpensesAccount(ExpensesAccount account);
  Future<bool> deleteExpensesAccount(String id);
}
