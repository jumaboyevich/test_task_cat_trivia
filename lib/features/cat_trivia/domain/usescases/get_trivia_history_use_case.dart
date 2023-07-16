import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usescases/usecase.dart';
import '../entities/cat_trivia_entity.dart';
import '../repositories/cat_trivia_repo.dart';
import 'get_trivia_use_case.dart';

class CatTriviaHistoryUseCase extends UseCase<List<CatTriviaEntity>, NoParams> {
  final CatTriviaRepository catTriviaRepository;

  CatTriviaHistoryUseCase({required this.catTriviaRepository});

  @override
  Future<Either<Failure, List<CatTriviaEntity>>> call(NoParams params) {
    return catTriviaRepository.getCatTriviaHistory();
  }
}
