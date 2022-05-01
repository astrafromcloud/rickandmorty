import 'package:bloc/bloc.dart';
import 'package:rickandmorty/logic/list/models/list_model.dart';
import 'package:rickandmorty/logic/list/repositories/list_repository.dart';

part 'list_state.dart';
part 'list_event.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {

  final CharactersRemoteRepository charactersRemoteRepository;

  CharactersBloc(this.charactersRemoteRepository) : super(CharactersInitial()) {
    on<LoadCharactersList>((event, emit) async {
      emit(CharactersLoading());
      try {
        final List<Character> characters = await charactersRemoteRepository.getCharacterList(event.page);
        emit(CharactersSuccess(characters));
      }
      catch(e) {
        emit(CharactersFailure(e.toString()));
      }
    });
  }



}