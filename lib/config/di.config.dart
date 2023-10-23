// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_client.dart' as _i4;
import '../bloc/core/home_page/home_page_cubit.dart' as _i6;
import '../services/api_service.dart' as _i5;
import 'modules/api_module.dart' as _i7;

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
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i3.Dio>(() => apiModule.dio());
  gh.lazySingleton<_i4.ApiClient>(() => apiModule.factClient(gh<_i3.Dio>()));
  gh.factory<_i5.ApiService>(() => _i5.ApiService(gh<_i4.ApiClient>()));
  gh.factory<_i6.HomePageCubit>(() => _i6.HomePageCubit(gh<_i5.ApiService>()));
  return getIt;
}

class _$ApiModule extends _i7.ApiModule {}
