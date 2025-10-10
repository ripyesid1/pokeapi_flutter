import 'package:flutter/material.dart';

class PokemonIndexProvider with ChangeNotifier {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  void incrementIndex() {
    _selectedIndex++;
    notifyListeners();
  }

  void decrementIndex() {
    if (_selectedIndex > 1) {
      _selectedIndex--;
      notifyListeners();
    }
  }
}
