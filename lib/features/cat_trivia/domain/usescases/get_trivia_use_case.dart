import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usescases/usecase.dart';
import '../entities/cat_trivia_entity.dart';
import '../repositories/cat_trivia_repo.dart';

class CatTriviaUseCase extends UseCase<CatTriviaEntity, NoParams> {
  final CatTriviaRepository catTriviaRepository;

  CatTriviaUseCase({required this.catTriviaRepository});

  @override
  Future<Either<Failure, CatTriviaEntity>> call(NoParams params) {
    return catTriviaRepository.getCatTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
