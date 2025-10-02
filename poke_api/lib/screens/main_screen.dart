import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Needed for JSON decoding

/* ALL OF THIS IS FOR THE DATA FETCHING FROM THE API
class Pokemon {
  final String name;
  final String abilities;

  Pokemon({required this.name, required this.abilities});

  // Factory method to create a Post object from a JSON map
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], abilities: json['abilities']);
  }
}

Future<Pokemon> fetchPost() async {
  final uri = Uri.parse(
    'https://pokeapi.co/api/v2/pokemon/ditto1',
  ); 
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server returns an OK response, parse the JSON.
    final jsonBody = json.decode(response.body);
    return Pokemon.fromJson(jsonBody);
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load post. Status code: ${response.statusCode}');
  }
}*/

class FullHomeScreen extends StatefulWidget {
  const FullHomeScreen({super.key});

  @override
  State<FullHomeScreen> createState() => _FullHomeScreenState();
}

class _FullHomeScreenState extends State<FullHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: HomeScreenBody());
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150),
        PokemonImage(
          url:
              "https://images.wikidexcdn.net/mwuploads/wikidex/7/77/latest/20150621181250/Pikachu.png",
        ),
        SizedBox(height: 80),
        PokemonDescription(name: "Pikachu", type: "Electric", habitat: "Por ahi"),
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
  final String type;
  final String habitat;
  const PokemonDescription({
    super.key,
    required this.name,
    required this.type,
    required this.habitat,
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
            Text("Pokemon name: ${widget.name}"),
            Text("Pokemon type: ${widget.type}"),
            Text("Pokemon Habitat: ${widget.habitat}"),
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
