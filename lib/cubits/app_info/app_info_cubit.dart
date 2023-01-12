import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_info_state.dart';
part 'app_info_cubit.freezed.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit(PackageInfo packageInfo)
      : super(AppInfoState(packageInfo: packageInfo));
}
