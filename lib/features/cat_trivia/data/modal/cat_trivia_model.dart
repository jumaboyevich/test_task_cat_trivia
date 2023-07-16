import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/cat_trivia_entity.dart';

part 'cat_trivia_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatTriviaModel {
  static const String boxKey = 'cat_trivia';

  @override
  @HiveField(0)
  String? text;

  @override
  @HiveField(1)
  String? createdAt;

  CatTriviaModel({this.text, this.createdAt});

  factory CatTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$CatTriviaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatTriviaModelToJson(this);
}

extension CountryModelX on CatTriviaModel {
  CatTriviaEntity toEntity() =>
      CatTriviaEntity(text: text, createdAt: createdAt);
}
