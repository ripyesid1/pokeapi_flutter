import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  //Retrieves the Json from the PokeApi and returns the raw JSON based on the index
  Future<Map<String, dynamic>> getData(int index) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed Call');
    }
  }
}
