// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_client.dart' as _i6;
import '../bloc/core/home_page/home_page_cubit.dart' as _i8;
import '../services/api_service.dart' as _i7;
import 'modules/api_module.dart' as _i10;
import 'modules/auto_router_module.dart' as _i9;
import 'router/app_router.dart' as _i3;
import 'router/cv_app_router.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final autoRouterModule = _$AutoRouterModule();
  final apiModule = _$ApiModule();
  gh.singleton<_i3.AppRouter>(autoRouterModule.appAutoRouter());
  gh.singleton<_i4.CvAppRouter>(_i4.CvAppRouter(gh<_i3.AppRouter>()));
  gh.lazySingleton<_i5.Dio>(() => apiModule.dio());
  gh.lazySingleton<_i6.ApiClient>(() => apiModule.apiClient(gh<_i5.Dio>()));
  gh.factory<_i7.ApiService>(() => _i7.ApiService(gh<_i6.ApiClient>()));
  gh.factory<_i8.HomePageCubit>(() => _i8.HomePageCubit(gh<_i7.ApiService>()));
  return getIt;
}

class _$AutoRouterModule extends _i9.AutoRouterModule {}

class _$ApiModule extends _i10.ApiModule {}
