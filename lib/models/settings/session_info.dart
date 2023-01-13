import 'package:flutter/material.dart';

import '../../utils/type_aliases.dart';
import '../abstract_models/abstract_models.dart';

/// Holds information about the users session that is stored to firebase
class SessionInfo extends Serializable {
  final String locale;
  final bool dsAutoplay;

  const SessionInfo({required this.locale, required this.dsAutoplay});

  @override
  JsonMap toJson() => {
        "locale": locale,
        "dsAutoplay": dsAutoplay,
      };
}
