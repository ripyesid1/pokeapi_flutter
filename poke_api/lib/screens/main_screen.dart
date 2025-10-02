import 'package:flutter/material.dart';

class FullHomeScreen extends StatefulWidget {
  const FullHomeScreen({super.key});

  @override
  State<FullHomeScreen> createState() => _FullHomeScreenState();
}

class _FullHomeScreenState extends State<FullHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 150),
          PokemonImage(),
          SizedBox(height: 80),
          PokemonDescription(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Pokemon Name"),
      backgroundColor: Colors.blue,
      centerTitle: true,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.catching_pokemon_outlined)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PokemonDescription extends StatelessWidget {
  const PokemonDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 185, 229, 252),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [Text("Pokemon type"), Text("Pokemon powers"), Text("Pokemon Habitat")],
        ),
      ),
    );
  }
}

class PokemonImage extends StatelessWidget {
  const PokemonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 40),
        Image.network(
          "https://images.wikidexcdn.net/mwuploads/wikidex/7/77/latest/20150621181250/Pikachu.png",
          height: 200,
          width: 300,
        ),
      ],
    );
  }
}
