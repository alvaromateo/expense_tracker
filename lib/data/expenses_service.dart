import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/expenses_account.dart';

abstract class ExpensesService {
  // ignore: slash_for_doc_comments
  /** 
   * Maybe is not needed and everything can be done
   * with the ExpensesAccountsService
   */

  const ExpensesService();

  Stream<List<Expense>> getExpenses();
  Stream<List<Expense>> getExpensesForAccountId(String accountId);
  Stream<List<Expense>> getExpensesForAccount(ExpensesAccount account) =>
      getExpensesForAccountId(account.id);

  Future<Expense> saveExpense(Expense expense);
  Future<bool> deleteExpense(String id);
}
