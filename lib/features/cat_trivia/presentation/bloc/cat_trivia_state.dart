part of 'cat_trivia_bloc.dart';

abstract class CatTriviaState extends Equatable {
  const CatTriviaState();

  @override
  List<Object> get props => [];
}

class CatTriviaInitial extends CatTriviaState {}

class CatTriviaLoading extends CatTriviaState {}

class CatTriviaLoadedSuccess extends CatTriviaState {
  final CatTriviaEntity entity;

  CatTriviaLoadedSuccess({required this.entity});
}

class CatTriviaHistoryLoadedSuccess extends CatTriviaState {
  final List<CatTriviaEntity> entities;

  CatTriviaHistoryLoadedSuccess({required this.entities});
}

class CatTriviaLoadedFailure extends CatTriviaState {
  final String message;

  CatTriviaLoadedFailure({required this.message});
}
