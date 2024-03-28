import 'package:expense_tracker/data/models/expenses_account.dart';
import 'package:expense_tracker/data/models/user.dart';

abstract interface class PreferencesService {
  Future<User?> getProfile();
  Future<bool> setProfile(User user);
  Future<ExpensesAccount?> getCurrentAccount();
  Future<bool> setCurrentAccount(ExpensesAccount account);
}
