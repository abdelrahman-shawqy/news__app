// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

import 'core/network/api_manager.dart' as _i90;
import 'core/network/internet_checker.dart' as _i701;
import 'core/network/RegisterModule.dart' as _i525;
import 'fetures/bloc/cubit.dart' as _i928;
import 'repository/local/home_local_repo.dart' as _i895;
import 'repository/local/home_local_repo_impl.dart' as _i883;
import 'repository/remote/home_remote_repo.dart' as _i233;
import 'repository/remote/home_remote_repo_impl.dart' as _i493;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i161.InternetConnection>(
      () => registerModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i90.ApiManager>(() => _i90.ApiManager());
    gh.factory<_i895.HomeLocalRepo>(() => _i883.HomeLocalRepoImpl());
    gh.lazySingleton<_i701.InternetConnectionss>(
      () => _i701.InternetConnectionImpl(
        gh<_i895.Connectivity>(),
        gh<_i161.InternetConnection>(),
      ),
    );
    gh.factory<_i233.HomeRemoteRepo>(
      () => _i493.HomeRemoteRepoImpl(gh<_i90.ApiManager>()),
    );
    gh.factory<_i928.HomeCubit>(
      () => _i928.HomeCubit(
        gh<_i233.HomeRemoteRepo>(),
        gh<_i895.HomeLocalRepo>(),
        gh<_i701.InternetConnectionss>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i525.RegisterModule {}
