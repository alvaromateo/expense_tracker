// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      userProfileId: json['userProfileId'] as int? ?? 0,
      currentAccountId: json['currentAccountId'] as int? ?? 0,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'userProfileId': instance.userProfileId,
      'currentAccountId': instance.currentAccountId,
    };
