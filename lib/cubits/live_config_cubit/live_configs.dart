part of 'live_config_cubit.dart';

// ==== Guide ====
// Leider sind trotz Hilfsfunktionen einige Schritte nötig um ein neues
// item hinzuzufügen:
//
// 1. Im `live_cubit_state` ein neues Feld hinzufügen
// 2. Constructor im Cubit ein 'false' hinzufügen (also den Fehler beheben)
// 3. In dieser Datei einen neuen Eintrag hinzufügen

final _liveConfigs = [
  LiveConfig(
      name: "Paged Post Feed",
      description:
          "Ob ein Fullscreen Post Feed (ähnlich der TikTok UI) verwentet werden soll",
      isSelected: (c) => _getState(c).map(neutral: (s) => s.pagedFeed),
      onToggle: (c, v) => _set(c, _getState(c).copyWith(pagedFeed: v))),
  LiveConfig(
      unused: true,
      name: "new Feed Items",
      description:
          "Ob die neuen FeedItems innerhalb der App verwendet werden sollen",
      isSelected: (c) => _getState(c).map(neutral: (s) => s.newFeedItems),
      onToggle: (c, v) => _set(c, _getState(c).copyWith(newFeedItems: v)))
];
