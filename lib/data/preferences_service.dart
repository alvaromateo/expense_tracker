import 'package:expense_tracker/data/models/person.dart';

abstract class PreferencesService {
  const PreferencesService();

  Future<Person> getProfile();
  Future<bool> setProfile(Person user);
}
