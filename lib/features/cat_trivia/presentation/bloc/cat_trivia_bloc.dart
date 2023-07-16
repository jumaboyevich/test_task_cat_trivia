import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task_cat_trivia/core/error/failures.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/domain/entities/cat_trivia_entity.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/domain/usescases/get_trivia_history_use_case.dart';
import 'package:test_task_cat_trivia/features/cat_trivia/domain/usescases/get_trivia_use_case.dart';

part 'cat_trivia_event.dart';
part 'cat_trivia_state.dart';

class CatTriviaBloc extends Bloc<CatTriviaEvent, CatTriviaState> {
  final CatTriviaUseCase catTriviaUseCase;
  final CatTriviaHistoryUseCase catTriviaHistoryUseCase;

  CatTriviaBloc(this.catTriviaUseCase, this.catTriviaHistoryUseCase)
      : super(CatTriviaInitial()) {
    on<GetCatTriviaEvent>(getCatTrivia);
    on<GetCatTriviaHistoryEvent>(getCatHistoryTrivia);
  }

  Future<void> getCatTrivia(
      GetCatTriviaEvent event, Emitter<CatTriviaState> emit) async {
    emit(CatTriviaLoading());
    final result = await catTriviaUseCase(NoParams());
    result.fold(
        (failure) => {
              if (failure is ConnectionFailure)
                {emit(CatTriviaLoadedFailure(message: failure.message))}
              else if (failure is ServerFailure)
                {
                  emit(CatTriviaLoadedFailure(
                    message: failure.message,
                  ))
                }
            },
        (r) => {
              emit(CatTriviaLoadedSuccess(entity: r)),
            });
  }

  Future<void> getCatHistoryTrivia(
      GetCatTriviaHistoryEvent event, Emitter<CatTriviaState> emit) async {
    emit(CatTriviaLoading());
    final result = await catTriviaHistoryUseCase(NoParams());
    result.fold(
        (failure) => {
              if (failure is ConnectionFailure)
                {emit(CatTriviaLoadedFailure(message: failure.message))}
              else if (failure is ServerFailure)
                {
                  emit(CatTriviaLoadedFailure(
                    message: failure.message,
                  ))
                }
            },
        (r) => {
              emit(CatTriviaHistoryLoadedSuccess(entities: r)),
            });
  }
}
