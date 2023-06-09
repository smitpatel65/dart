import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier {
  final List<int> _selectItem = [];
  List<int> get selectItem => _selectItem;
  void addItem(int value) {
    _selectItem.add(value);
    notifyListeners();  
  }
  void removItem(int value) {
    _selectItem.remove(value);
    notifyListeners();  
  }
}
