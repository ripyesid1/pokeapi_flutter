import 'package:flutter/material.dart';
import 'package:pokemon_displayer/fetching/pokemon.dart';
import 'package:pokemon_displayer/providers/pokemon_index_provider.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatelessWidget {
  final Pokemon pokemonDisplayed;
  const PokemonScreen({super.key, required this.pokemonDisplayed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(colors: colors, imageUrl: pokemonDisplayed.image[0]),
        body: PokemonDisplayCard(
          name: pokemonDisplayed.name,
          health: pokemonDisplayed.health,
          baseExperience: pokemonDisplayed.baseExperience,
          image: pokemonDisplayed.image,
        ),
      ),
    );
  }
}

class PokemonDisplayCard extends StatelessWidget {
  final String name;
  final int health;
  final int baseExperience;
  final List<String> image;
  const PokemonDisplayCard({
    super.key,
    required this.name,
    required this.health,
    required this.baseExperience,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors.surfaceContainerHighest,
        ),
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: SizedBox(height: 400, width: 400, child: Image.network(image[0], scale: 0.5)),
            ),
            PokemonDescription(name: name, health: health, baseExperience: baseExperience),
            PokemonCardButtons(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.colors, this.imageUrl = ""});

  final String imageUrl;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Pokemon Displayer"),
      centerTitle: true,
      backgroundColor: colors.primary,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(child: Image.network(imageUrl)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PokemonDescription extends StatefulWidget {
  final String name;
  final int health;
  final int baseExperience;
  const PokemonDescription({
    super.key,
    required this.name,
    required this.health,
    required this.baseExperience,
  });

  @override
  State<PokemonDescription> createState() => _PokemonDescriptionState();
}

class _PokemonDescriptionState extends State<PokemonDescription> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 5,
        children: [
          Text(
            widget.name.toUpperCase(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: colors.primary),
          ),
          Text("HP: ${widget.health}", style: TextStyle(color: colors.primary)),
          Text("Base XP: ${widget.baseExperience}", style: TextStyle(color: colors.primary)),
        ],
      ),
    );
  }
}

class PokemonCardButtons extends StatelessWidget {
  const PokemonCardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(colors.primary)),
            onPressed: () {
              context.read<PokemonIndexProvider>().decrementIndex();
            },
            child: Icon(Icons.navigate_before_rounded, color: colors.surfaceContainerHigh),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(colors.primary)),
            onPressed: () {},
            child: Icon(Icons.catching_pokemon_rounded, color: colors.surfaceContainerHigh),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(colors.primary)),
            onPressed: () {
              context.read<PokemonIndexProvider>().incrementIndex();
            },
            child: Icon(Icons.navigate_next_rounded, color: colors.surfaceContainerHigh),
          ),
        ],
      ),
    );
  }
}
