import 'package:http/http.dart' as http;
import 'dart:convert'; // Needed for JSON decoding

class Pokemon {
  final String name;
  final int health;
  final int baseExperience;
  final String image;

  Pokemon({
    required this.name,
    required this.health,
    required this.baseExperience,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      health: json['health'],
      baseExperience: json['baseExperience'],
      image: json['image'],
    );
  }
}

class PokemonCall {
  Future<Pokemon> getPokemon(int index) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String name = data['name'];
      int baseExperience = data['base_experience'];
      String image = data['sprites']['front_default'];
      int hp = 0;
      for (int i = 0; i < data['stats'].length; i++) {
        if (data['stats'][i]['stat']['name'] == 'hp') {
          hp = data['stats'][i]['base_stat'];
          break;
        }
      }

      Pokemon pokemon = Pokemon(
        name: name,
        health: hp,
        baseExperience: baseExperience,
        image: image,
      );

      return pokemon;
    } else {
      throw Exception('Failed Call');
    }
  }
}

void main() async {
  PokemonCall call = PokemonCall();
  Pokemon pokemon = await call.getPokemon(1);
  print(pokemon.health);
}
