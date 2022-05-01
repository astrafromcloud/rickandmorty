import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.image, required this.name, required this.type, required this.species, required this.episodes, required this.status, required this.gender}) : super(key: key);
  
  final String image;
  final String name;
  final String type;
  final String species;
  final List<String> episodes;
  final String status;
  final String gender;

  // final List<AssetImage> imagesList = [
  //   AssetImage('assets/image/1.png'),
  //   AssetImage('assets/image/2.png'),
  //   AssetImage('assets/image/3.png'),
  //   AssetImage('assets/image/4.png'),
  //   AssetImage('assets/image/5.png'),
  //   AssetImage('assets/image/7.png'),
  //   AssetImage('assets/image/8.png'),
  // ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: Hero(
                  tag: 'myHero',
                  child: Image.network(image),
                ),

              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[100],
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Center(child: Text(name, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold), softWrap: true, maxLines: 1,)),
                    SizedBox(height: 20,),
                    Container(
                      height: 180,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('🧑', style: TextStyle(fontSize: 42),),
                                    Text(species, style: TextStyle(fontSize: 20),)
                                  ],
                                ),
                              Divider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('🌌', style: TextStyle(fontSize: 42),),
                                  Text(type == '' ? 'Earth' : type, style: TextStyle(fontSize: 20),)
                                ],
                              ),
                            ],
                          ),
                          Divider(thickness: 2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(status == 'Alive' ? '💖' : '🖤', style: TextStyle(fontSize: 42),),
                                  Text(status, style: TextStyle(fontSize: 20),)
                                ],
                              ),
                              Divider(),
                              Column(
                                children: [
                                  Text(gender == 'Male' ? '♂' : '♀' , style: TextStyle(fontSize: 42),),
                                  Text(gender, style: TextStyle(fontSize: 20),)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                     SizedBox(height: 30,),
                    SizedBox(
                      width: 300,
                      height: 150,
                      child: Center(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: episodes.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              ),
                              elevation: 8,
                              child: Container(
                                // decoration: BoxDecoration(
                                //   image: DecorationImage(
                                //       image: imagesList[index % imagesList.length],
                                //       scale: 4,
                                //       alignment: Alignment.topCenter
                                //   ),
                                // ),
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(seasonFind(episodes)[index].toString(), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                                    Text('season', style: TextStyle(fontSize: 16),),
                                    Text(episodeFind(episodes)[index].toString(), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                                    Text('episode', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                          ),
                            );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<int> seasonFind(List<String> str) {
    List<int> list = [];
    int season;
    for (String aStr in str)
    {
      String str = aStr.replaceAll(RegExp(r'[^0-9]'), '');
      int parse = int.parse(str);

      if (parse <= 11) {
        season = 1;
      }
      else if (parse >= 12 && parse <= 21) {
        season = 2;
      }
      else if (parse >= 22 && parse <= 31) {
        season = 3;
      }
      else if (parse >= 32 && parse <= 41) {
        season = 4;
      }
      else {
        season = 5;
      }
      list.add(season);
    }
    return list;
  }

  List<int> episodeFind(List<String> str) {
    int episode;
    List<int> list = [];
    for (String aStr in str)
    {
      String str = aStr.replaceAll(RegExp(r'[^0-9]'), '');
      int parse = int.parse(str);

      if (parse <= 11) {
        episode = parse;
      }
      else if (parse >= 12 && parse <= 21) {
        episode = parse - 11;
      }
      else if (parse >= 22 && parse <= 31) {
        episode = parse - 21;
      }
      else if (parse >= 32 && parse <= 41) {
        episode = parse - 31;
      }
      else {
        episode = parse - 41;
      }
      list.add(episode);
    }
    return list;
  }

  // List<String>
}
