import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';
import '../utils.dart';

/// Holds information about the users session that is stored to firebase
class SessionInfo extends Serializable {
  final String locale;
  final String version;
  final String operatingSystem;
  final String deviceId;
  final DateTime lastUsedAt;

  final String? fcmToken;

  const SessionInfo(
      {required this.locale,
      required this.version,
      required this.operatingSystem,
      required this.deviceId,
      required this.lastUsedAt,
      this.fcmToken});

  SessionInfo copyWith({
    String? locale,
    String? version,
    String? operatingSystem,
    String? deviceId,
    String? fcmToken,
    DateTime? lastUsedAt,
  }) =>
      SessionInfo(
        locale: locale ?? this.locale,
        version: version ?? this.version,
        operatingSystem: operatingSystem ?? this.operatingSystem,
        deviceId: deviceId ?? this.deviceId,
        fcmToken: fcmToken ?? this.fcmToken,
        lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      );

  factory SessionInfo.fromJson(JsonMap json) => SessionInfo(
      locale: json["locale"],
      version: json["version"],
      operatingSystem: json["operatingSystem"],
      deviceId: json["deviceId"],
      fcmToken: json["fcmToken"],
      lastUsedAt: dateFromJson(json["lastUsedAt"]));

  @override
  JsonMap toJson() => {
        "locale": locale,
        "version": version,
        "operatingSystem": operatingSystem,
        "deviceId": deviceId,
        "fcmToken": fcmToken,
        "lastUsedAt": dateToJson(lastUsedAt)
      };
}
