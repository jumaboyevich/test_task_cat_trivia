import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';
import '../modal/cat_trivia_model.dart';

abstract class CatTriviaLocalDatasource {
  List<CatTriviaModel> getCatTriviaHistory();

  Future<void> cacheCatTrivia(CatTriviaModel model);
}

class CatTriviaLocalDataSourceImpl implements CatTriviaLocalDatasource {
  CatTriviaLocalDataSourceImpl();

  final _catTriviaBox = Hive.box<CatTriviaModel>(CatTriviaModel.boxKey);
  @override
  Future<void> cacheCatTrivia(CatTriviaModel model) {
    return _catTriviaBox.add(model);
  }

  @override
  List<CatTriviaModel> getCatTriviaHistory() {
    final localData = _catTriviaBox.values;
    if (localData == null) {
      throw CacheException();
    }
    return localData.toList();
  }
}
