// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../auth/data/login_API_request.dart' as _i7;
import '../auth/data/login_repository.dart' as _i16;
import '../auth/data/request_token_api.dart' as _i11;
import '../auth/presentation/login_view_model.dart' as _i17;
import '../favorite/data/favorite_movie_dao.dart' as _i6;
import '../favorite/data/favorite_movie_repository.dart' as _i14;
import '../favorite/presentation/favorite_view_model.dart' as _i15;
import '../movie/data/fake_movie_api.dart' as _i10;
import '../movie/data/moive_dao.dart' as _i8;
import '../movie/data/movie_api.dart' as _i9;
import '../movie/data/movie_repository.dart' as _i18;
import '../movie/presentation/widgets/movie_details_view_model.dart' as _i20;
import '../movie/presentation/widgets/movies_view_model.dart' as _i19;
import '../user/data/session_token.dart' as _i12;
import 'network/network_module.dart' as _i22;
import 'storage/app_database.dart' as _i3;
import 'storage/fake_storage_module.dart' as _i4;
import 'storage/storage_module.dart' as _i21;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final fakeStorageModule = _$FakeStorageModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppDatabase>(
    () => storageModule.database,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i3.AppDatabase>(
    () => fakeStorageModule.database,
    registerFor: {_test},
    dispose: _i4.disposeDatabase,
  );
  gh.lazySingleton<_i5.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i6.FavoriteMoviesDao>(
      () => _i6.FavoriteMoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i7.LoginAPI>(() => _i7.LoginAPI(get<_i5.Dio>()));
  gh.lazySingleton<_i8.MovieDao>(() => _i8.MovieDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i9.MoviesApi>(
    () => _i9.MoviesApi(get<_i5.Dio>()),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i9.MoviesApi>(
    () => _i10.FakeMoviesApi(),
    registerFor: {_test},
  );
  gh.lazySingleton<_i11.RequestTokenAPI>(
      () => _i11.RequestTokenAPI(get<_i5.Dio>()));
  gh.lazySingleton<_i12.SessionTokenApi>(
      () => _i12.SessionTokenApi(get<_i5.Dio>()));
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => storageModule.sharedPreferences,
    registerFor: {_dev},
    preResolve: true,
  );
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => fakeStorageModule.sharedPreferences,
    registerFor: {_test},
    preResolve: true,
  );
  gh.lazySingleton<_i14.FavoriteMovieRepository>(
      () => _i14.FavoriteMovieRepository(
            get<_i6.FavoriteMoviesDao>(),
            get<_i8.MovieDao>(),
          ));
  gh.factory<_i15.FavoritesViewModel>(
      () => _i15.FavoritesViewModel(get<_i14.FavoriteMovieRepository>()));
  await gh.singletonAsync<_i16.LoginRepository>(
    () => _i16.LoginRepository.create(
      get<_i7.LoginAPI>(),
      get<_i11.RequestTokenAPI>(),
      get<_i12.SessionTokenApi>(),
      get<_i13.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i17.LoginViewModel>(
      () => _i17.LoginViewModel(get<_i16.LoginRepository>()));
  gh.lazySingleton<_i18.MovieRepository>(() => _i18.MovieRepository(
        get<_i9.MoviesApi>(),
        get<_i8.MovieDao>(),
      ));
  gh.factory<_i19.MoviesViewModel>(() => _i19.MoviesViewModel(
        get<_i18.MovieRepository>(),
        get<_i14.FavoriteMovieRepository>(),
      ));
  gh.factoryParam<_i20.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i20.MovieDetailsViewModel(
        get<_i18.MovieRepository>(),
        get<_i14.FavoriteMovieRepository>(),
        movieId,
      ));
  return get;
}

class _$StorageModule extends _i21.StorageModule {}

class _$FakeStorageModule extends _i4.FakeStorageModule {}

class _$NetworkModule extends _i22.NetworkModule {}
