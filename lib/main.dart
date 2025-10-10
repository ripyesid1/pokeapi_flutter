import 'package:flutter/material.dart';
import 'package:pokemon_displayer/config/theme/app_theme.dart';
import 'package:pokemon_displayer/presenter/presenter.dart';
import 'package:pokemon_displayer/providers/pokemon_index_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PokemonIndexProvider())],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 4).theme(),
      home: Presenter(),
    );
  }
}
