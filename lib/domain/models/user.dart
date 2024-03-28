import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
      ];

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
