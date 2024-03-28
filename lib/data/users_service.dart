import 'package:expense_tracker/data/models/user.dart';

abstract interface class UsersService {
  Stream<List<User>> getUsers();
  Future<User?> getUser(int userId);
}
