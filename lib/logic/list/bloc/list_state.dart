part of 'list_bloc.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersSuccess extends CharactersState {
  final List<Character> charactersList;

  CharactersSuccess(this.charactersList);
}

class CharactersFailure extends CharactersState {
  final String errorMessage;

  CharactersFailure(this.errorMessage);
}