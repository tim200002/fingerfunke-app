import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/settings/app_settings.dart';
import '../../repositories/storage_repository/storage_repository.dart';

part 'app_settings_cubit.freezed.dart';
part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettings> {
  final StorageRepository _storageRepository = StorageRepositoryImpl();
  AppSettingsCubit() : super(const AppSettings()) {
    emit(_storageRepository.getSettings() ?? const AppSettings());
  }

  factory AppSettingsCubit.of(BuildContext context) =>
      BlocProvider.of<AppSettingsCubit>(context);

  void set({
    String? locale,
    ThemeMode? themeMode,
    bool? dsAutoplay,
  }) async {
    var settings = AppSettings(
        locale: locale ?? state.locale,
        themeMode: themeMode ?? state.themeMode,
        dsAutoplay: dsAutoplay ?? state.dsAutoplay);
    await _storageRepository.setSettings(settings);
    emit(settings);
  }
}
