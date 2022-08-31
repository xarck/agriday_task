import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intern_task/enums/sorting_enums.dart';
import 'package:intern_task/models/fruit_info_model.dart';

class MarketController extends ChangeNotifier {
  List<String> fruitNames = ["Apple", "Grapes", "Grapes", "Waterelon", "Lemon"];
  List<FruitInfo> fruitInfo = [];
  List<FruitInfo> searchFruits = [];
  SortingWays currentSort = SortingWays.ASCNAME;
  String searchTerm = "";

  void readJSON() async {
    String x = await rootBundle.loadString('assets/data/fruits.json');
    Map<String, dynamic> map = json.decode(x);
    List<dynamic> items = map['data'];
    items.forEach((element) {
      fruitInfo.add(FruitInfo.fromJson(element));
    });
    notifyListeners();
  }

  void searchingFruit(String query) {
    searchTerm = query;
    searchFruits = [];
    fruitInfo.forEach(
      (fruitSeller) {
        if (fruitSeller.product!.toLowerCase().contains(query.toLowerCase())) {
          searchFruits.add(fruitSeller);
        }
      },
    );
    notifyListeners();
  }

  void sortFruitList(bool ascending, bool name) {
    if (name) {
      if (!ascending) {
        fruitInfo.sort((a, b) => (b.seller)!.compareTo(a.seller!));
        currentSort = SortingWays.ASCNAME;
      } else {
        fruitInfo.sort((a, b) => (a.seller)!.compareTo(b.seller!));
        currentSort = SortingWays.DESCNAME;
      }
    } else {
      if (!ascending) {
        fruitInfo.sort((a, b) => (b.price)!.compareTo(a.price!));
        currentSort = SortingWays.ASCPRICE;
      } else {
        fruitInfo.sort((a, b) => (a.price)!.compareTo(b.price!));
        currentSort = SortingWays.DESCPRICE;
      }
    }
    notifyListeners();
  }
}
