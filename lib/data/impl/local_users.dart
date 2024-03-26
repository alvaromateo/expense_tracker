import 'package:expense_tracker/data/models/user.dart';
import 'package:expense_tracker/data/users_service.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable(as: UsersService)
class LocalStorageUsers implements UsersService {
  final Isar _isar;

  const LocalStorageUsers(this._isar);

  @override
  Stream<List<User>> getUsers() {
    Query<User> allUsers = _isar.users.buildQuery();
    return allUsers.watch(fireImmediately: true);
  }
}
