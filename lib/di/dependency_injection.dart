import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/data/datasource/cat_trivia_local_datasource.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/data/datasource/cat_trivia_remote_datasource.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/data/modal/cat_trivia_model.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/data/repository/cat_trivia_repo_impl.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/domain/repositories/cat_trivia_repo.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/domain/usescases/get_trivia_history_use_case.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/domain/usescases/get_trivia_use_case.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/presentation/bloc/cat_trivia_bloc.dart';

import '../core/network/network_info.dart';

final di = GetIt.instance;

Future<void> init() async {
  /// Blocs
  di.registerFactory(
    () => CatTriviaBloc(di(), di()),
  );

  /// UsesCases

  di.registerLazySingleton(() => CatTriviaUseCase(catTriviaRepository: di()));

  di.registerLazySingleton(
      () => CatTriviaHistoryUseCase(catTriviaRepository: di()));

  /// Data sources

  di.registerLazySingleton(
    () => CatTriviaLocalDataSourceImpl(),
  );
  di.registerLazySingleton(
    () => CatTriviaRemoteDatasourceImpl(di()),
  );

  di.registerLazySingleton<CatTriviaLocalDatasource>(
    () => CatTriviaLocalDataSourceImpl(),
  );
  di.registerLazySingleton<CatTriviaRemoteDatasource>(
    () => CatTriviaRemoteDatasourceImpl(di()),
  );

  ///Repositories

  di.registerLazySingleton<CatTriviaRepository>(
    () => CatTriviaRepositoryImpl(
      networkInfo: di(),
      remoteDatasource: di(),
      localDatasource: di(),
    ),
  );

  ///Network

  di.registerSingleton<Dio>(Dio());

  /// Network Info
  di.registerLazySingleton(() => InternetConnectionChecker());

  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  /// Local datasource
  await Hive.initFlutter();

  Hive.registerAdapter<CatTriviaModel>(
    CatTriviaModelAdapter(),
  );

  await Hive.openBox<CatTriviaModel>(
    CatTriviaModel.boxKey,
  );
}
