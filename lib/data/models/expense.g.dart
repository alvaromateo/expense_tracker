// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      id: json['id'] as String?,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      paidBy: Person.fromJson(json['paidBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'category': _$CategoryEnumMap[instance.category]!,
      'paidBy': instance.paidBy,
    };

const _$CategoryEnumMap = {
  Category.groceries: 'groceries',
  Category.bills: 'bills',
  Category.rent: 'rent',
  Category.leisure: 'leisure',
  Category.travel: 'travel',
  Category.work: 'work',
};
