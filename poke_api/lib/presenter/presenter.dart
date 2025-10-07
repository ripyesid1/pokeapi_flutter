import 'package:flutter/material.dart';
import 'package:poke_api/fetching/api_call.dart';
import 'package:poke_api/fetching/pokemon.dart';
import 'package:poke_api/screens/main_screen.dart';

Future<Map<String, dynamic>> fillData(int index) async {
  ApiCall call = ApiCall();
  Map<String, dynamic> data = await call.getData(index);
  return data;
}

class Presenter extends StatefulWidget {
  const Presenter({super.key});

  @override
  State<Presenter> createState() => _PresenterState();
}

class _PresenterState extends State<Presenter> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Pokemon App",
        color: Colors.blueGrey,
        icon: Icons.catching_pokemon,
      ),
      body: FutureBuilder(
        future: fillData(index),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else if (snapshot.hasData) {
            Pokemon pokemon = Pokemon.fromJson(snapshot.data!);
            return PokemonDisplayCard(
              pokemon: pokemon,
              onCatchPressed: () {
                setState(() {
                  index++;
                });
              },
            );
          } else {
            return Text("No data found");
          }
        },
      ),
    );
  }
}
