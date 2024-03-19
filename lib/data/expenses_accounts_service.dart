import 'package:expense_tracker/data/models/expenses_account.dart';

abstract class ExpensesAccountsService {
  const ExpensesAccountsService();

  Stream<List<ExpensesAccount>> getExpensesAccounts();
  Future<ExpensesAccount> saveExpensesAccount(ExpensesAccount account);
  Future<bool> deleteExpensesAccount(String id);
}
