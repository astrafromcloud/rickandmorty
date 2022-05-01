import 'package:dio/dio.dart';

abstract class CharactersRemoteDataSource {
  Future<Response> getCharactersList(int page);
}

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {

  Dio dio = Dio();

  @override
  Future<Response> getCharactersList(int page) async {

    Response response = await dio.get('https://rickandmortyapi.com/api/character/?page=$page');

    return response;
  }
}
