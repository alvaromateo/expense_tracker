import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const Person({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  /// Deserializes the given JSON map into a [Person].
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Converts this [Person] into a JSON map.
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  List<Object> get props => [email, phoneNumber];
}
