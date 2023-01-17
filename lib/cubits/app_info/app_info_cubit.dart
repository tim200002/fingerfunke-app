import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoCubit extends Cubit<PackageInfo> {
  AppInfoCubit(super.packageInfo);

  String get versionString => "${state.version}+${state.buildNumber}";
}
