import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/settings/app_settings.dart';
import '../../models/settings/session_info.dart';
import '../../repositories/storage_repository/storage_repository.dart';
import '../../repositories/user_repository/user_repository.dart';
import '../../utils/tools.dart';
import '../app_cubit/app_cubit.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  final StorageRepository _storageRepository = StorageRepositoryImpl();
  final UserRepository _userRepository = UserRepositoryImpl();
  AppSettingsCubit() : super(const AppSettings()) {
    emit(_storageRepository.getSettings() ?? const AppSettings());
  }

  static Widget builder(
          Widget Function(BuildContext context, AppSettings settings)
              builder) =>
      BlocBuilder<AppSettingsCubit, AppSettings>(builder: builder);

  /// persisting the settings a user set (or that were set by default) to
  /// firebase. This allows us to have the information on the server side
  /// and for example send notifications in the correct language.
  ///
  /// In the future we might want to switch to firebase being the single source
  /// of truth for settings, but this would include handling connection issues,
  /// and preserving the locale value "system".
  ///
  /// Therefor I (Robin) for now chose to leave the underlying structure as is,
  /// even if this means we save settings locally AND in firebase
  Future<void> copyToFirebase(BuildContext context, [String? userId]) async {
    try {
      String uId = userId ?? context.read<AppCubit>().state.user.id;
      SessionInfo info = SessionInfo(
          locale:
              state.locale == "system" ? Intl.getCurrentLocale() : state.locale,
          dsAutoplay: state.dsAutoplay);
      _userRepository.setSessionInfo(uId, info);
    } catch (e) {
      logger.d(
          "copyToFirebase (or set settings) was called while no "
          "user was present in the context. "
          "Could not persist session info to firebase",
          e);
    }
  }

  void set(BuildContext context, {required AppSettings settings}) async {
    await _storageRepository.setSettings(settings);
    emit(settings);
    copyToFirebase(context);
  }
}
