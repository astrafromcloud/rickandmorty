import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rickandmorty/logic/list/bloc/list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:rickandmorty/widgets/list_widget.dart';

import '../../injection_container.dart';
import '../../logic/list/models/list_model.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  Dio dio = Dio();

  // final _controller = ScrollController();
  final RefreshController refreshController = RefreshController();
  // late EasyRefreshController _controller;

  int page = 1;
  List<Character> characters = [];
  bool _isPagination = false;

  // @override
  // void initState() {
  //   _controller = EasyRefreshController();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return sl<CharactersBloc>()..add(LoadCharactersList(page: page));
    }, child: BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is CharactersInitial) {
          return const Center(
            child: Text('This page is Initial!'),
          );
        }
        if (state is CharactersLoading) {
          // if (!_isPagination)
          // {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // else {
          //   return customList(characters);
          // }
        // }
        if (state is CharactersSuccess) {
          // if (_isPagination) {
            characters.addAll(state.charactersList);
          //   refreshController.loadComplete();
          //   _isPagination = false;
          // }
          // else {
          //   characters = state.charactersList;
          // }
          return
            // SmartRefresher(
            // // scrollController: _controller,
            //   controller: refreshController,
            //   enablePullDown: false,
            //   enablePullUp: true,
            //   onLoading: () {
            //     // _isPagination = true;
            //     page++;
            //     context
            //         .read<CharactersBloc>()
            //         .add(LoadCharactersList(page: page));
            //   },
            //   child:
              customList(characters);
        }
        if (state is CharactersFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }
        return const Offstage();
      },
    ));
  }

  Widget customList(List<Character> characters) {
    return CustomScrollView(
      // controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  flex: 15,
                  child: Container(),
                ),
                Flexible(
                    flex: 20,
                    child:
                        Image.asset(
                      'assets/image/morty.png',
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            background: Image.asset(
                'assets/image/rick.jpg',
                fit: BoxFit.cover,
              ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                var item = (characters)[index];
                return ListWidget(
                    networkImage: item.image,
                    name: item.name,
                    species: item.species, character: item,);
              }),
        ]))
      ],
    );
  }
}
