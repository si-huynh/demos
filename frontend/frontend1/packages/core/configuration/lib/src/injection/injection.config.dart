// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:common/common.dart' as _i107;
import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:routing/routing.dart' as _i297;

import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i297.AppRouter>(() => registerModule.appRouter);
    gh.singleton<_i437.SecureStorageService>(() => registerModule.storage);
    gh.singleton<_i107.Environment>(() => registerModule.env);
    gh.singletonAsync<_i372.ApiClient>(() => registerModule.apiClient);
    await gh.singletonAsync<_i494.UserRepository>(
      () => registerModule.userRepository,
      preResolve: true,
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
