import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/settings/app_settings.dart';
import '../../repositories/storage_repository/storage_repository.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  final StorageRepository _storageRepository = StorageRepositoryImpl();
  AppSettingsCubit() : super(const AppSettings()) {
    emit(_storageRepository.getSettings() ?? const AppSettings());
  }

  static Widget builder(
          Widget Function(BuildContext context, AppSettings settings)
              builder) =>
      BlocBuilder<AppSettingsCubit, AppSettings>(builder: builder);

  void set(BuildContext context, {required AppSettings settings}) async {
    await _storageRepository.setSettings(settings);
    emit(settings);
  }
}
