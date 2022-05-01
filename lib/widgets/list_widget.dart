import 'package:flutter/material.dart';
import 'package:rickandmorty/screens/list_all/detail_screen.dart';

import '../logic/list/models/list_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget(
      {Key? key,
      required this.networkImage,
      required this.name,
      required this.species, required this.character})
      : super(key: key);

  final String networkImage;
  final String name;
  final String species;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100),
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        child: ClipRRect(
          child: MaterialButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(species: character.species, type: character.type, name: character.name, image: character.image, episodes: character.episode, status: character.status, gender: character.gender,)));},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // padding: EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100)
                  ),
                    clipBehavior: Clip.hardEdge,
                    child: Image(image: NetworkImage(networkImage))),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        softWrap: true,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        species,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.145,),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
