import 'package:expense_tracker/data/models/person.dart';

abstract class UsersService {
  const UsersService();

  Stream<List<Person>> getUsers();
}
