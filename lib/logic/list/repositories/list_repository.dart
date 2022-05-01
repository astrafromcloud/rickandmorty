import 'package:dio/dio.dart';
import 'package:rickandmorty/logic/list/datasources/list_datasource.dart';
import 'package:rickandmorty/logic/list/models/list_model.dart';

abstract class CharactersRemoteRepository {
  Future getCharacterList(int page);
}

class CharacterRemoteRepositoryImpl implements CharactersRemoteRepository {

  final CharactersRemoteDataSource charactersRemoteDataSource;

  CharacterRemoteRepositoryImpl(this.charactersRemoteDataSource);

  @override
  Future getCharacterList(int page) async{

    Response response = await charactersRemoteDataSource.getCharactersList(page);
    late final character = CharactersModel.fromJson(response.data);
    return character.results;
  }

}