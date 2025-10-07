import 'package:flutter/material.dart';
import 'package:poke_api/fetching/pokemon.dart';
import 'dart:async';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final IconData icon;
  const CustomAppBar({super.key, required this.title, required this.color, required this.icon});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: widget.color,
      leading: Icon(widget.icon),
    );
  }
}

class Description extends StatefulWidget {
  final String name;
  final int hp;
  final int baseExperience;
  final Color color;

  const Description({
    super.key,
    required this.name,
    required this.hp,
    required this.baseExperience,
    required this.color,
  });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(15)),
      width: 250,
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pokemon name: ${widget.name}"),
          Text("Health: ${widget.hp}"),
          Text("Base Experience: ${widget.baseExperience}"),
        ],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10, height: 10),
          Text("Data is loading..."),
        ],
      ),
    );
  }
}

class PokemonDisplayCard extends StatelessWidget {
  final Pokemon pokemon; // Replace 'Pokemon' with your actual model class
  final VoidCallback onCatchPressed; // The callback function

  const PokemonDisplayCard({super.key, required this.pokemon, required this.onCatchPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // Use Alignment.center instead of AlignmentGeometry.center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageDisplay(pokemon: pokemon),
          Description(
            name: pokemon.name,
            hp: pokemon.health,
            baseExperience: pokemon.baseExperience,
            color: const Color.fromARGB(255, 148, 191, 211),
          ),
          FloatingActionButton(
            // Use the passed-in callback
            onPressed: onCatchPressed,
            child: Icon(Icons.catching_pokemon_sharp),
          ),
        ],
      ),
    );
  }
}

class ImageDisplay extends StatefulWidget {
  const ImageDisplay({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
      width: 250,
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: ImageToggler(images: widget.pokemon.image),
    );
  }
}

class ImageToggler extends StatefulWidget {
  final List<String> images;
  const ImageToggler({super.key, required this.images});

  @override
  State<ImageToggler> createState() => _ImageTogglerState();
}

class _ImageTogglerState extends State<ImageToggler> {
  int index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 1. Inicia el "ciclo asíncrono"
    _startImageToggle();
  }

  void _startImageToggle() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        index = 1 - index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(widget.images[index], scale: 0.5);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
