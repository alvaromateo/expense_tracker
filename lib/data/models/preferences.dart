import 'package:json_annotation/json_annotation.dart';

part '../generated/preferences.g.dart';

@JsonSerializable()
class Preferences {
  static int kDefaultUserProfileId = 0;
  static int kDefaultCurrentAccountId = 0;

  int userProfileId;
  int currentAccountId;

  Preferences({
    this.userProfileId = 0,
    this.currentAccountId = 0,
  });

  /// Deserializes the given JSON map into a [Expense].
  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  /// Converts this [Expense] into a JSON map.
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}
