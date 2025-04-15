// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_arch/configs/arch_core/base_data_source.dart' as _i149;
import 'package:clean_arch/configs/arch_core/concrete_data_source.dart'
    as _i678;
import 'package:clean_arch/configs/dependency/modules/di_module.dart' as _i305;
import 'package:clean_arch/configs/network/network_util.dart' as _i826;
import 'package:clean_arch/feature/home/data/repository/home_repository.dart'
    as _i387;
import 'package:clean_arch/feature/home/data/sources/remote/home_remote_data_source.dart'
    as _i1058;
import 'package:clean_arch/feature/home/domain/repository/home_repository_impl.dart'
    as _i1007;
import 'package:clean_arch/feature/home/domain/use_cases/get_crypto_usecase.dart'
    as _i638;
import 'package:clean_arch/feature/home/domain/use_cases/sort_crypto_by_name_usecase.dart'
    as _i156;
import 'package:clean_arch/feature/home/domain/use_cases/sort_crypto_by_price_usecase.dart'
    as _i745;
import 'package:clean_arch/feature/home/presentation/bloc/home_bloc.dart'
    as _i280;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i156.SortCryptoByNameUseCase>(
        () => _i156.SortCryptoByNameUseCase());
    gh.factory<_i745.SortCryptoByPriceUseCase>(
        () => _i745.SortCryptoByPriceUseCase());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i826.NetworkUtil>(
        () => _i826.NetworkUtil(gh<String>(instanceName: 'baseUrl')));
    gh.factory<_i1058.HomeRemoteDataSource>(
        () => _i1058.HomeRemoteDataSourceImpl(gh<_i826.NetworkUtil>()));
    gh.factory<_i149.BaseDataSource>(
        () => _i678.ConcreteDataSource(gh<_i826.NetworkUtil>()));
    gh.factory<_i387.HomeRepository>(
        () => _i1007.HomeRepositoryImpl(gh<_i1058.HomeRemoteDataSource>()));
    gh.factory<_i638.GetCryptoUseCase>(
        () => _i638.GetCryptoUseCase(gh<_i387.HomeRepository>()));
    gh.factory<_i280.HomeBloc>(() => _i280.HomeBloc(
          gh<_i638.GetCryptoUseCase>(),
          gh<_i156.SortCryptoByNameUseCase>(),
          gh<_i745.SortCryptoByPriceUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i305.RegisterModule {}
