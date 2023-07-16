import 'package:equatable/equatable.dart';

class CatTriviaEntity extends Equatable {
  const CatTriviaEntity({
    required this.text,
    required this.createdAt,
  });

  final String? text;
  final String? createdAt;

  @override
  List<Object> get props => [text!, createdAt!];
}
