import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../modal/cat_trivia_model.dart';

abstract class CatTriviaRemoteDatasource {
  Future<CatTriviaModel> getCatTrivia();
}

class CatTriviaRemoteDatasourceImpl extends CatTriviaRemoteDatasource {
  final Dio _client;

  CatTriviaRemoteDatasourceImpl(this._client);

  @override
  Future<CatTriviaModel> getCatTrivia() async {
    try {
      Map<String, dynamic> queryParameters = {"animal_type": "cat"};
      String url = 'https://cat-fact.herokuapp.com/facts/random';

      final result = await _client.get(url, queryParameters: queryParameters);

      if (result.data == null) {
        return CatTriviaModel(text: '', createdAt: '');
      }

      return CatTriviaModel.fromJson(result.data);
    } on Exception catch (exception) {
      debugPrint(exception.toString());
      return CatTriviaModel(text: '', createdAt: '');
    }
  }
}
