// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:expense_tracker/data/expenses_service.dart' as _i7;
import 'package:expense_tracker/data/impl/data_register.dart' as _i12;
import 'package:expense_tracker/data/impl/local_expenses.dart' as _i8;
import 'package:expense_tracker/data/impl/local_preferences.dart' as _i10;
import 'package:expense_tracker/data/impl/local_users.dart' as _i6;
import 'package:expense_tracker/data/preferences_service.dart' as _i9;
import 'package:expense_tracker/data/users_service.dart' as _i5;
import 'package:expense_tracker/domain/repositories/preferences_repository.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataRegister = _$DataRegister();
    await gh.factoryAsync<_i3.Isar>(
      () => dataRegister.isar,
      preResolve: true,
    );
    gh.factoryAsync<_i4.SharedPreferences>(() => dataRegister.preferences);
    gh.factory<_i5.UsersService>(() => _i6.LocalStorageUsers(gh<_i3.Isar>()));
    gh.factory<_i7.ExpensesService>(
        () => _i8.LocalStorageExpenses(gh<_i3.Isar>()));
    gh.factoryAsync<_i9.PreferencesService>(
        () async => _i10.LocalStoragePreferences(
              await getAsync<_i4.SharedPreferences>(),
              gh<_i3.Isar>(),
            ));
    gh.factoryAsync<_i11.PreferencesRepository>(() async =>
        _i11.PreferencesRepository(await getAsync<_i9.PreferencesService>()));
    return this;
  }
}

class _$DataRegister extends _i12.DataRegister {}
