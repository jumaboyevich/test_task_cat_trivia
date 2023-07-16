// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_trivia_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatTriviaModelAdapter extends TypeAdapter<CatTriviaModel> {
  @override
  final int typeId = 0;

  @override
  CatTriviaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatTriviaModel(
      text: fields[0] as String?,
      createdAt: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatTriviaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatTriviaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatTriviaModel _$CatTriviaModelFromJson(Map<String, dynamic> json) =>
    CatTriviaModel(
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CatTriviaModelToJson(CatTriviaModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'createdAt': instance.createdAt,
    };
