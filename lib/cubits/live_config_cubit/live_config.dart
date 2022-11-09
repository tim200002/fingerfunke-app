part of 'live_config_cubit.dart';

// helper functions
void _set(BuildContext c, LiveConfigState state) =>
    c.read<LiveConfigCubit>().set(state);
LiveConfigState _getState(BuildContext c) => c.read<LiveConfigCubit>().state;

class LiveConfig {
  final String name;
  final String description;
  final bool unused;
  final bool Function(BuildContext) isSelected;
  final Function(BuildContext c, bool select) onToggle;

  const LiveConfig(
      {required this.name,
      required this.description,
      required this.isSelected,
      required this.onToggle,
      this.unused = false});

  static List<LiveConfig> configs = _liveConfigs;

  static Widget builder(Widget Function(LiveConfigState config) builder) {
    return BlocBuilder<LiveConfigCubit, LiveConfigState>(
        buildWhen: (_, __) => true, builder: (_, state) => builder(state));
  }
}
