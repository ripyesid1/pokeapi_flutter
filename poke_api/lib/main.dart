import 'package:flutter/material.dart';
import 'package:poke_api/presenter/presenter.dart';
import 'package:poke_api/screens/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PokeApi', home: Presenter());
  }
}
