// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/expenses_account.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExpensesAccountCollection on Isar {
  IsarCollection<ExpensesAccount> get expensesAccounts => this.collection();
}

const ExpensesAccountSchema = CollectionSchema(
  name: r'ExpensesAccount',
  id: 1346137373167039864,
  properties: {
    r'title': PropertySchema(
      id: 0,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _expensesAccountEstimateSize,
  serialize: _expensesAccountSerialize,
  deserialize: _expensesAccountDeserialize,
  deserializeProp: _expensesAccountDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'expenses': LinkSchema(
      id: 4364841983118932117,
      name: r'expenses',
      target: r'Expense',
      single: false,
    ),
    r'participants': LinkSchema(
      id: -8976695537870828975,
      name: r'participants',
      target: r'User',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _expensesAccountGetId,
  getLinks: _expensesAccountGetLinks,
  attach: _expensesAccountAttach,
  version: '3.1.0+1',
);

int _expensesAccountEstimateSize(
  ExpensesAccount object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _expensesAccountSerialize(
  ExpensesAccount object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.title);
}

ExpensesAccount _expensesAccountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExpensesAccount(
    title: reader.readString(offsets[0]),
  );
  return object;
}

P _expensesAccountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expensesAccountGetId(ExpensesAccount object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expensesAccountGetLinks(ExpensesAccount object) {
  return [object.expenses, object.participants];
}

void _expensesAccountAttach(
    IsarCollection<dynamic> col, Id id, ExpensesAccount object) {
  object.expenses.attach(col, col.isar.collection<Expense>(), r'expenses', id);
  object.participants
      .attach(col, col.isar.collection<User>(), r'participants', id);
}

extension ExpensesAccountQueryWhereSort
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QWhere> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpensesAccountQueryWhere
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QWhereClause> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpensesAccountQueryFilter
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QFilterCondition> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ExpensesAccountQueryObject
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QFilterCondition> {}

extension ExpensesAccountQueryLinks
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QFilterCondition> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expenses(FilterQuery<Expense> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'expenses');
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expensesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'expenses', length, true, length, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expensesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'expenses', 0, true, 0, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expensesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'expenses', 0, false, 999999, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expensesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'expenses', 0, true, length, include);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expensesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'expenses', length, include, 999999, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      expensesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'expenses', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participants(FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'participants');
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participantsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'participants', length, true, length, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'participants', 0, true, 0, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'participants', 0, false, 999999, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'participants', 0, true, length, include);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'participants', length, include, 999999, true);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterFilterCondition>
      participantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'participants', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ExpensesAccountQuerySortBy
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QSortBy> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ExpensesAccountQuerySortThenBy
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QSortThenBy> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ExpensesAccount, ExpensesAccount, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ExpensesAccountQueryWhereDistinct
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QDistinct> {
  QueryBuilder<ExpensesAccount, ExpensesAccount, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension ExpensesAccountQueryProperty
    on QueryBuilder<ExpensesAccount, ExpensesAccount, QQueryProperty> {
  QueryBuilder<ExpensesAccount, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExpensesAccount, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesAccount _$ExpensesAccountFromJson(Map<String, dynamic> json) =>
    ExpensesAccount(
      title: json['title'] as String,
    );

Map<String, dynamic> _$ExpensesAccountToJson(ExpensesAccount instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
