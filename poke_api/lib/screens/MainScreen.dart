import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomImageDisplayer(), CharacteristicsDisplay()]);
  }
}

//Get Pokemon Characteristics and display here

class CharacteristicsDisplay extends StatelessWidget {
  const CharacteristicsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 131, 180, 226),
      padding: EdgeInsets.all(40),
      child: Column(
        children: [Text("Characteristic 1:"), Text("Characteristic 2:"), Text("Characteristic 3:")],
      ),
    );
  }
}

class CustomImageDisplayer extends StatelessWidget {
  const CustomImageDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(80),
      child: Image.network(
        'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text("POKEMON NAME HOLDER", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromARGB(255, 148, 177, 228),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
