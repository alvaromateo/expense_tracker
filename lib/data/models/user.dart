import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part '../generated/user.g.dart';

@JsonSerializable()
@Collection(inheritance: false)
class User {
  final Id id = Isar.autoIncrement;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  /// Deserializes the given JSON map into a [Person].
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Converts this [Person] into a JSON map.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
