// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesAccount _$ExpensesAccountFromJson(Map<String, dynamic> json) =>
    ExpensesAccount(
      id: json['id'] as String?,
      title: json['title'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpensesAccountToJson(ExpensesAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'participants': instance.participants,
    };
