class CharactersModel {
  CharactersModel({required this.results});

  final List<Character> results;
  // final List<Info> info;

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      CharactersModel(
        results: List<Character>.from(
            json["results"].map((x) => Character.fromJson(x))),
        // info: List<Info>.from(json['info'].map((e) => Info.fromJson(e))),
      );

// Map<String, dynamic> toJson() => {
//   "results": List<dynamic>.from(results.map((x) => x.toJson())),
// };
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.episode,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<String> episode;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      image: json["image"],
      episode: List<String>.from(json["episode"].map((x) => x)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
      };
}

// class Info {
//   final int pages;
//   final int count;
//
//   Info({
//     required this.pages,
//     required this.count,
//   });
//
//   factory Info.fromJson(Map<String, dynamic> json) => Info(
//         pages: json["pages"],
//         count: json["count"],
//       );
//
//   Map<String, dynamic> toJson() => {"pages": pages, "count": count};
// }
