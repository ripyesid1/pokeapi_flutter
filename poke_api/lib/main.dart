import 'package:flutter/material.dart';
import 'package:poke_api/presenter/presenter.dart';

void main() => runApp(const MyApp());

List<Color> seeds = [Colors.amber.shade200, Colors.teal.shade200];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seeds[1])),
      title: 'PokeApi',
      home: Presenter(),
    );
  }
}
