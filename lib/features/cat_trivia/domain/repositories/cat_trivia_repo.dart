import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/cat_trivia_entity.dart';

abstract class CatTriviaRepository {
  Future<Either<Failure, CatTriviaEntity>> getCatTrivia();

  Future<Either<Failure, List<CatTriviaEntity>>> getCatTriviaHistory();
}
