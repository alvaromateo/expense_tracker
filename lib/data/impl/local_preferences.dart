import 'package:expense_tracker/data/models/expenses_account.dart';
import 'package:expense_tracker/data/models/preferences.dart';
import 'package:expense_tracker/data/models/user.dart';
import 'package:expense_tracker/data/preferences_service.dart';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kUserProfileIdProperty = 'userProfileId';
const _kCurrentAccountIdProperty = 'currentAccountId';

@Injectable(as: PreferencesService)
class LocalStoragePreferences implements PreferencesService {
  final SharedPreferences _sharedPreferences;
  final Isar _isar;
  Preferences? preferences;

  LocalStoragePreferences(this._sharedPreferences, this._isar);

  @override
  Future<User?> getProfile() {
    _initPreferences();
    return _isar.users.get(preferences!.userProfileId);
  }

  @override
  Future<bool> setProfile(User user) {
    _initPreferences();
    preferences!.userProfileId = user.id;
    return _sharedPreferences.setInt(_kUserProfileIdProperty, user.id);
  }

  @override
  Future<ExpensesAccount?> getCurrentAccount() {
    _initPreferences();
    return _isar.expensesAccounts.get(preferences!.currentAccountId);
  }

  @override
  Future<bool> setCurrentAccount(ExpensesAccount account) {
    _initPreferences();
    preferences!.currentAccountId = account.id;
    return _sharedPreferences.setInt(_kCurrentAccountIdProperty, account.id);
  }

  void _initPreferences() {
    if (preferences == null) {
      final int? userProfileId =
          _sharedPreferences.getInt(_kUserProfileIdProperty);
      final int? currentAccountId =
          _sharedPreferences.getInt(_kCurrentAccountIdProperty);
      preferences = Preferences(
        userProfileId: userProfileId ?? Preferences.kDefaultUserProfileId,
        currentAccountId:
            currentAccountId ?? Preferences.kDefaultCurrentAccountId,
      );
    }
  }
}
