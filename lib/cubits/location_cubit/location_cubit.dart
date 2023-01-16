import 'package:app_settings/app_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/place.dart';
import '../../repositories/position_repository/position_repository.dart';
import '../../services/device_location_service.dart';
import '../../services/session_info_service.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

/// Stores current location of the user
class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState.loading()) {
    refresh(request: false);
  }

  /// Load current location
  void refresh({bool request = true}) {
    emit(const LocationState.loading());
    LocationService.getLocation(request: request).then((place) {
      SessionInfoService.instance.setLocation(place);
      emit(LocationState.loaded(place));
    },
        onError: (e) => emit(e is AppPermissionDeniedException
            ? LocationState.denied(e.permanent)
            : LocationState.error(e)));
  }

  static Future<void> openSettings() => AppSettings.openAppSettings();
}
