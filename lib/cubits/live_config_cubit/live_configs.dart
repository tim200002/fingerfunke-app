part of 'live_config_cubit.dart';

// ==== Guide ====
// Leider sind trotz Hilfsfunktionen einige Schritte nötig um ein neues
// item hinzuzufügen:
//
// 1. Im `live_config_cubit` ein neues Feld im State hinzufügen
//    - Constructor im Cubit ein 'false' hinzufügen (also den Fehler beheben)
// 2. In dieser Datei einen neuen Eintrag hinzufügen

final List<LiveConfig> _liveConfigs = [
  LiveConfig(
      name: "Feedback Button verstecken",
      description: "Einen Button für Feedback auf dem Home-Bildschirm zeigen",
      isSelected: (c) => _getState(c).hideFeedbackBtn,
      onToggle: (c, v) => _set(c, _getState(c).copyWith(hideFeedbackBtn: v))),
];
