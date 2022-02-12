import 'package:flutter/material.dart';
import 'package:pokedex/modules/home/screen/home._screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',      
      home: HomePage(title: 'Pokedex'),
      routes: {},
    );
  }
}
