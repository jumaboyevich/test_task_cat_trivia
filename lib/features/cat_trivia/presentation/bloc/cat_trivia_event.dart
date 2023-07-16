part of 'cat_trivia_bloc.dart';

abstract class CatTriviaEvent extends Equatable {
  const CatTriviaEvent();

  @override
  List<Object> get props => [];
}

class GetCatTriviaEvent extends CatTriviaEvent {}

class GetCatTriviaHistoryEvent extends CatTriviaEvent {}
