import 'package:flutter/material.dart';

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

class NetworkImageWidget extends StatefulWidget {
  final String url;
  const NetworkImageWidget({super.key, required this.url});

  @override
  ImageState createState() => ImageState();
}

class ImageState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.network(widget.url);
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
      color: widget.color,
      child: Column(
        children: [Text(widget.name), Text("${widget.hp}"), Text("${widget.baseExperience}")],
      ),
    );
  }
}
