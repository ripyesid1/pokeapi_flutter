import 'package:flutter/material.dart';
import 'package:pokemon_displayer/fetching/api_call.dart';
import 'package:pokemon_displayer/fetching/pokemon.dart';
import 'package:pokemon_displayer/presentation/pokemon/screens/pokemon_screen.dart';
import 'package:pokemon_displayer/providers/pokemon_index_provider.dart';
import 'package:provider/provider.dart';

class Presenter extends StatefulWidget {
  const Presenter({super.key});

  @override
  State<Presenter> createState() => _PresenterState();
}

class _PresenterState extends State<Presenter> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<PokemonIndexProvider>().selectedIndex;
    Future<Map<String, dynamic>> json = ApiCall().getData(currentIndex); // Example Pokemon
    return FutureBuilder<Map<String, dynamic>>(
      future: json,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final pokemonDisplayed = Pokemon.fromJson(snapshot.data!);
          return PokemonScreen(pokemonDisplayed: pokemonDisplayed);
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}
