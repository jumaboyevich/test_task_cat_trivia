import 'package:dartz/dartz.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/data/modal/cat_trivia_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/cat_trivia_entity.dart';
import '../../domain/repositories/cat_trivia_repo.dart';
import '../datasource/cat_trivia_local_datasource.dart';
import '../datasource/cat_trivia_remote_datasource.dart';

class CatTriviaRepositoryImpl implements CatTriviaRepository {
  final CatTriviaRemoteDatasourceImpl remoteDatasource;
  final CatTriviaLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  CatTriviaRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, CatTriviaEntity>> getCatTrivia() async {
    if (await networkInfo.isConnected) {
      try {
        final catTrivia = await remoteDatasource.getCatTrivia();
        await localDatasource.cacheCatTrivia(catTrivia);
        final entity = catTrivia.toEntity();
        return Right(entity);
      } on ServerException {
        return Left(ServerFailure("Api bilan xatolik yuz berdi"));
      }
    } else {
      return Left(ConnectionFailure("Internetni tekshiring"));
    }
  }

  @override
  Future<Either<Failure, List<CatTriviaEntity>>> getCatTriviaHistory() async {
    try {
      final models = await localDatasource.getCatTriviaHistory();
      final entities =
          models.map<CatTriviaEntity>((e) => e.toEntity()).toList();
      return Right(entities);
    } on CacheException {
      return Left(CacheFailure("Ma'lumotlar omborida xatolik yuz berdi"));
    }
  }
}
