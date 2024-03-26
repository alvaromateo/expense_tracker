import 'package:expense_tracker/data/expenses_service.dart';
import 'package:expense_tracker/data/models/expenses_account.dart';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable(as: ExpensesService)
class LocalStorageExpenses implements ExpensesService {
  final Isar _isar;

  const LocalStorageExpenses(this._isar);

  @override
  Future<bool> deleteExpensesAccount(Id id) {
    return _isar.expensesAccounts.delete(id);
  }

  @override
  Stream<List<ExpensesAccount>> getExpensesAccounts() {
    Query<ExpensesAccount> allAccounts = _isar.expensesAccounts.buildQuery();
    return allAccounts.watch(fireImmediately: true);
  }

  @override
  Future<int> saveExpensesAccount(ExpensesAccount account) {
    return _isar.expensesAccounts.put(account);
  }
}
