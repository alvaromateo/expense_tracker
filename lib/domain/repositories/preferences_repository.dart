import 'package:expense_tracker/data/preferences_service.dart';
import 'package:expense_tracker/data/users_service.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';
import 'package:expense_tracker/data/models/user.dart' as dto_user;

@injectable
class PreferencesRepository {
  final PreferencesService _preferencesService;
  final UsersService _usersService;

  const PreferencesRepository(this._preferencesService, this._usersService);

  Future<User?> getProfile() async {
    dto_user.User? userDTO = await _preferencesService.getProfile();
    if (userDTO != null) {
      return User(
        id: userDTO.id,
        firstName: userDTO.firstName,
        lastName: userDTO.lastName,
        email: userDTO.email,
        phoneNumber: userDTO.phoneNumber,
      );
    }
    return null;
  }

  Future<bool> saveProfile(User user) async {
    dto_user.User userDTO;
    if (user.id != null) {
      dto_user.User? userFromDB = await _usersService.getUser(user.id!);
      if (userFromDB != null) {
        userDTO = userFromDB
          ..firstName = user.firstName
          ..lastName = user.lastName
          ..email = user.email
          ..phoneNumber = user.phoneNumber;
      } else {
        userDTO = _createNewUserDTO(user);
      }
    } else {
      userDTO = _createNewUserDTO(user);
    }
    return _preferencesService.setProfile(userDTO);
  }

  dto_user.User _createNewUserDTO(User user) {
    return dto_user.User(
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }
}
