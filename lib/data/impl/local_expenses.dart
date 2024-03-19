import 'package:expense_tracker/data/expenses_service.dart';
import 'package:expense_tracker/data/models/expenses_account.dart';

class LocalExpenses extends ExpensesService {
  @override
  Future<bool> deleteExpensesAccount(String id) {
    // TODO: implement deleteExpensesAccount
    throw UnimplementedError();
  }

  @override
  Stream<List<ExpensesAccount>> getExpensesAccounts() {
    // TODO: implement getExpensesAccounts
    throw UnimplementedError();
  }

  @override
  Future<ExpensesAccount> saveExpensesAccount(ExpensesAccount account) {
    // TODO: implement saveExpensesAccount
    throw UnimplementedError();
  }
}
