import 'package:flutter/material.dart';
import 'package:poke_api/fetching/api_call.dart';

class FullHomeScreen extends StatefulWidget {
  const FullHomeScreen({super.key});

  @override
  State<FullHomeScreen> createState() => _FullHomeScreenState();
}

class _FullHomeScreenState extends State<FullHomeScreen> {
  Future<Pokemon> getPokemon() async {
    PokemonCall call = PokemonCall();
    Pokemon pokemon = await call.getPokemon(7);
    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: getPokemon(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return HomeScreenBody(pokemon: snapshot.data);
          }
        },
      ),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  final Pokemon pokemon;
  const HomeScreenBody({super.key, required this.pokemon});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150),
        PokemonImage(url: widget.pokemon.image),
        SizedBox(height: 80),
        PokemonDescription(
          name: widget.pokemon.name,
          hp: widget.pokemon.health,
          baseExperience: widget.pokemon.baseExperience,
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Pokemon Getter"),
      backgroundColor: Colors.blue,
      centerTitle: true,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.catching_pokemon_outlined)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PokemonDescription extends StatefulWidget {
  final String name;
  final int hp;
  final int baseExperience;
  const PokemonDescription({
    super.key,
    required this.name,
    required this.hp,
    required this.baseExperience,
  });

  @override
  State<PokemonDescription> createState() => _PokemonDescriptionState();
}

class _PokemonDescriptionState extends State<PokemonDescription> {
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
          children: [
            Text("Name: ${widget.name}"),
            Text("Health: ${widget.hp}"),
            Text("Base Experience: ${widget.baseExperience}"),
          ],
        ),
      ),
    );
  }
}

class PokemonImage extends StatefulWidget {
  final String url;
  const PokemonImage({super.key, required this.url});

  @override
  State<PokemonImage> createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [SizedBox(width: 40), Image.network(widget.url, height: 200, width: 300)]);
  }
}
