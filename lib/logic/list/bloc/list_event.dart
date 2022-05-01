part of 'list_bloc.dart';

abstract class CharactersEvent {}

class LoadCharactersList extends CharactersEvent{
  final int page;

  LoadCharactersList({required this.page});
}