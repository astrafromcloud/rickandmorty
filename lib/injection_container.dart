import 'package:get_it/get_it.dart';
import 'package:rickandmorty/logic/list/bloc/list_bloc.dart';
import 'package:rickandmorty/logic/list/datasources/list_datasource.dart';
import 'package:rickandmorty/logic/list/repositories/list_repository.dart';

var sl = GetIt.instance;
void initGetIt() async{
    sl.registerFactory<CharactersBloc>(() => CharactersBloc(sl()));

    sl.registerLazySingleton<CharactersRemoteRepository>(() => CharacterRemoteRepositoryImpl(sl()));

    sl.registerLazySingleton<CharactersRemoteDataSource>(() => CharactersRemoteDataSourceImpl());
}