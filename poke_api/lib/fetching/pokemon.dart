class Pokemon {
  final String name;
  final int health;
  final int baseExperience;
  final List<String> image;

  Pokemon({
    required this.name,
    required this.health,
    required this.baseExperience,
    required this.image,
  });

  //builds the pokemon object model based on the JSON that api_call provides
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    int baseExperience = 0;
    String image1 = json['sprites']['front_default'];
    String image2 = json['sprites']['back_default'];
    String image3 = json['sprites']['front_shiny'];
    final List<String> image = [image1, image2, image3];
    int hp = 0;

    //looks for the health stat in the json
    for (int i = 0; i < json['stats'].length; i++) {
      if (json['stats'][i]['stat']['name'] == 'hp') {
        hp = json['stats'][i]['base_stat'];
        break;
      }
    }

    //creates and returns the pokemon object model
    return Pokemon(name: name, health: hp, baseExperience: baseExperience, image: image);
  }
}
