import 'package:flutter/material.dart';
import 'package:rickandmorty/injection_container.dart';
import 'package:rickandmorty/screens/list_all/list_screen.dart';

void main() {
  initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
          body: CharactersListScreen(),
      ),
    );
  }
}
